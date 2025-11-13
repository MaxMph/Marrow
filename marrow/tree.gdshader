shader_type spatial;

uniform sampler2D albedo_tex: source_color;

uniform vec3 tint_col: source_color = vec3(0.0, 0.0, 0.0);
uniform float fade_start = 0.0;
uniform float fade_end = 1.0;
uniform float tint_str = 0.5;

varying float loc_height;

void vertex() {
	loc_height = VERTEX.y;
}

void fragment() {
	float height = loc_height;
	//float fade = clamp((height - fade_start) / (fade_end - fade_start), 0.0, 1.0);
	float fade = smoothstep(fade_start, fade_end, height);
	
	float tint_factor = 1.0 - fade;
	
	vec3 base_color = texture(albedo_tex, UV).rgb;
	vec3 final_color = mix(base_color, base_color * tint_col, tint_factor * tint_str);
	
	ALBEDO = final_color;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
