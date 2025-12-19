#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec4 color;
    float aalias;
    float radius;
    float borderWidth;

    float progress;
};

float sdRoundRect(vec2 point, vec2 size, float radius) {
    vec2 q = abs(point) - (size - radius);
    return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - radius;
}

void main() {
    /* This is really the extent of the square, we are interesed only in one quadrant */
    vec2 size = vec2(1.0);
    lowp vec4 transparency = vec4(0.0, 0.0, 0.0, 0.0);

    vec2 uv = qt_TexCoord0;

    //translate rectangle origin to corner
    vec2 point = uv;

    float d_outer = sdRoundRect(point, size, radius);
    vec2 innerSize = size - borderWidth;
    float innerRadius = max(0.0, radius - borderWidth);
    float d_inner = sdRoundRect(point, innerSize, innerRadius);

    float d_border = max(d_outer, -d_inner);

    //gradient
    float alpha = clamp(pow(uv.x * uv.y, 2.0), 0.0, 1.0);
    //first apply gradient
    vec4 rcolor = mix(transparency, color, alpha);
    //remove the colour from outer borders
    rcolor = mix(rcolor, transparency, smoothstep(0.0, aalias, d_outer));
    //color the borders
    rcolor = mix(color, rcolor, smoothstep(0.0, aalias, d_border));
    //separate gradient on borders,
    rcolor = mix(transparency, rcolor, uv.x * uv.y * progress);

    fragColor = rcolor * qt_Opacity;
}
