Shader "Custom/lightmap" {
	Properties {
		_Color("Main Color", Color) = (1,1,1,1)
		_SpecColor("Spec Color", Color) = (1,1,1,1)
		_Shininess("Shininess", Range(0.01, 1)) = 0.7
		_MainTex("Base (RGB)", 2D) = "white" {}
	_LightMap("Lightmap (RGB)", 2D) = "black" {}
	}
		SubShader{
		/* Upgrade NOTE: commented out, possibly part of old style per-pixel lighting: Blend AppSrcAdd AppDstAdd */
		Fog{ Color[_AddFog] }

	
		Pass{
		Name "BASE"
		Tags{ "LightMode" = "Always" /* Upgrade NOTE: changed from PixelOrNone to Always */ }
		Color[_PPLAmbient]
		BindChannels{
		Bind "Vertex", vertex
		Bind "normal", normal
		Bind "texcoord1", texcoord0 
		Bind "texcoord", texcoord1 
	}
		SetTexture[_LightMap]{
		constantColor[_Color]
		combine texture * constant DOUBLE
	}
		SetTexture[_MainTex]{
		constantColor[_Color]
		combine texture * previous, texture * constant
	}
	}

	
		Pass{
		Name "BASE"
		Tags{ "LightMode" = "Vertex" }
		Material{
		Diffuse[_Color]
		Shininess[_Shininess]
		Specular[_SpecColor]
	}

		Lighting On
		SeparateSpecular On

		BindChannels{
		Bind "Vertex", vertex
		Bind "normal", normal
		Bind "texcoord1", texcoord0 
		Bind "texcoord1", texcoord1 
		Bind "texcoord", texcoord2 
	}

		SetTexture[_LightMap]{
		constantColor[_Color]
		combine texture * constant
	}
		SetTexture[_LightMap]{
		combine previous + primary
	}
		SetTexture[_MainTex]{
		combine texture * previous DOUBLE, texture * primary
	}
	}
	}

		

		SubShader{
		/* Upgrade NOTE: commented out, possibly part of old style per-pixel lighting: Blend AppSrcAdd AppDstAdd */
		Fog{ Color[_AddFog] }

		
		Pass{
		Name "BASE"
		Tags{ "LightMode" = "Always" }
		Color[_PPLAmbient]
		BindChannels{
		Bind "Vertex", vertex
		Bind "normal", normal
		Bind "texcoord1", texcoord0 
		Bind "texcoord", texcoord1 
	}
		SetTexture[_LightMap]{
		constantColor[_Color]
		combine texture * constant DOUBLE
	}
		SetTexture[_MainTex]{
		combine texture * previous, texture * primary
	}
	}

		
		Pass{
		Name "BASE"
		Tags{ "LightMode" = "Vertex" }
		Material{
		Diffuse[_Color]
		Shininess[_Shininess]
		Specular[_SpecColor]
	}

		Lighting On
		SeparateSpecular On

		ColorMask RGB

		SetTexture[_MainTex]{
		combine texture * primary DOUBLE, texture
	}
	}
	}

		

		SubShader{
		/* Upgrade NOTE: commented out, possibly part of old style per-pixel lighting: Blend AppSrcAdd AppDstAdd */
		Fog{ Color[_AddFog] }

		
		Pass{
		Name "BASE"
		Tags{ "LightMode" = "Always" }
		BindChannels{
		Bind "Vertex", vertex
		Bind "texcoord1", texcoord0 
	}
		SetTexture[_LightMap]{ constantColor[_Color] combine texture * constant DOUBLE }
	}

		
		Pass{
		Name "BASE"
		Tags{ "LightMode" = "Always" }
		BindChannels{
		Bind "Vertex", vertex
		Bind "texcoord", texcoord0 
	}
		Blend Zero SrcColor
		SetTexture[_MainTex]{ combine texture }
	}
	}

		Fallback "VertexLit", 1

}
