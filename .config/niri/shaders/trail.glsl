vec4 trail(vec3 coords_geo, vec3 size_geo) {
    vec2 velocity = vec2(0, 5);
    const int trail_samples = 8;

    vec2 uv = (niri_geo_to_tex * coords_geo).xy;

    vec2 dir = normalize(velocity);
    float trail = length(velocity) * niri_progress;
    vec4 smear = texture2D(niri_tex, uv - dir * trail) * 0.7;

    vec4 blur = vec4(0.0);
    for (int i = 0; i < trail_samples; ++i) {
        float t = (float(i) / float(trail_samples - 1)) * trail;
        blur += texture2D(niri_tex, uv - dir * t);
    }
    blur /= float(trail_samples);

    vec4 color = mix(texture2D(niri_tex, uv), smear + blur, 0.85);
    return color;
}
