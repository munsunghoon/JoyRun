// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33764,y:32591,varname:node_9361,prsc:2|custl-3084-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32793,y:33308,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:5927,x:33214,y:32832,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2644,x:32794,y:32832,ptovrint:False,ptlb:LightMap,ptin:_LightMap,varname:node_9622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False|UVIN-4599-UVOUT;n:type:ShaderForge.SFN_Lerp,id:9981,x:33043,y:32832,varname:node_9981,prsc:2|A-2644-RGB,B-607-OUT,T-2644-RGB;n:type:ShaderForge.SFN_ValueProperty,id:607,x:32794,y:32749,ptovrint:False,ptlb:LightMap_Pow,ptin:_LightMap_Pow,varname:node_1949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.7;n:type:ShaderForge.SFN_TexCoord,id:4599,x:32540,y:32832,varname:node_4599,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6144,x:33214,y:32976,varname:node_6144,prsc:2|A-9981-OUT,B-1080-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:1080,x:33046,y:33117,varname:node_1080,prsc:2,chbt:1|M-6455-RGB,R-851-RGB,G-2545-RGB,B-8205-RGB,BTM-7410-RGB;n:type:ShaderForge.SFN_Tex2d,id:2545,x:32793,y:33505,ptovrint:False,ptlb:Diffuse2,ptin:_Diffuse2,varname:node_2545,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8205,x:32793,y:33700,ptovrint:False,ptlb:Diffuse3,ptin:_Diffuse3,varname:node_8205,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:2601,x:33407,y:32832,varname:node_2601,prsc:2|A-5927-RGB,B-6144-OUT;n:type:ShaderForge.SFN_Tex2d,id:6455,x:32793,y:33117,ptovrint:False,ptlb:BlendMap,ptin:_BlendMap,varname:node_8849,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4599-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7410,x:32793,y:33900,ptovrint:False,ptlb:Diffuse4,ptin:_Diffuse4,varname:_Diffuse4,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3084,x:33590,y:32832,varname:node_3084,prsc:2|A-2601-OUT,B-2426-RGB,C-4467-OUT;n:type:ShaderForge.SFN_LightColor,id:2426,x:33407,y:32976,varname:node_2426,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:900,x:33214,y:33117,varname:node_900,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:4467,x:33407,y:33117,varname:node_4467,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-900-OUT;proporder:607-5927-2644-6455-851-2545-8205-7410;pass:END;sub:END;*/

Shader "BGShader/BG_Blinn_TextureBlend_Lowest" {
    Properties {
        _LightMap_Pow ("LightMap_Pow", Float ) = 1.7
        _Color ("Color", Color) = (1,1,1,1)
        _LightMap ("LightMap", 2D) = "gray" {}
        _BlendMap ("BlendMap", 2D) = "white" {}
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Diffuse2 ("Diffuse2", 2D) = "white" {}
        _Diffuse3 ("Diffuse3", 2D) = "white" {}
        _Diffuse4 ("Diffuse4", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu 
            #pragma target 2.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _Color;
            uniform sampler2D _LightMap; uniform float4 _LightMap_ST;
            uniform float _LightMap_Pow;
            uniform sampler2D _Diffuse2; uniform float4 _Diffuse2_ST;
            uniform sampler2D _Diffuse3; uniform float4 _Diffuse3_ST;
            uniform sampler2D _BlendMap; uniform float4 _BlendMap_ST;
            uniform sampler2D _Diffuse4; uniform float4 _Diffuse4_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _LightMap_var = tex2D(_LightMap,TRANSFORM_TEX(i.uv1, _LightMap));
                float4 _BlendMap_var = tex2D(_BlendMap,TRANSFORM_TEX(i.uv1, _BlendMap));
                float4 _Diffuse4_var = tex2D(_Diffuse4,TRANSFORM_TEX(i.uv0, _Diffuse4));
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float4 _Diffuse2_var = tex2D(_Diffuse2,TRANSFORM_TEX(i.uv0, _Diffuse2));
                float4 _Diffuse3_var = tex2D(_Diffuse3,TRANSFORM_TEX(i.uv0, _Diffuse3));
                float3 finalColor = ((_Color.rgb*(lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*(lerp( lerp( lerp( _Diffuse4_var.rgb, _Diffuse_var.rgb, _BlendMap_var.rgb.r ), _Diffuse2_var.rgb, _BlendMap_var.rgb.g ), _Diffuse3_var.rgb, _BlendMap_var.rgb.b ))))*_LightColor0.rgb*(attenuation*0.5+0.5));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu 
            #pragma target 2.0
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _Color;
            uniform sampler2D _LightMap; uniform float4 _LightMap_ST;
            uniform float _LightMap_Pow;
            uniform sampler2D _Diffuse2; uniform float4 _Diffuse2_ST;
            uniform sampler2D _Diffuse3; uniform float4 _Diffuse3_ST;
            uniform sampler2D _BlendMap; uniform float4 _BlendMap_ST;
            uniform sampler2D _Diffuse4; uniform float4 _Diffuse4_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _LightMap_var = tex2D(_LightMap,TRANSFORM_TEX(i.uv1, _LightMap));
                float4 _BlendMap_var = tex2D(_BlendMap,TRANSFORM_TEX(i.uv1, _BlendMap));
                float4 _Diffuse4_var = tex2D(_Diffuse4,TRANSFORM_TEX(i.uv0, _Diffuse4));
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float4 _Diffuse2_var = tex2D(_Diffuse2,TRANSFORM_TEX(i.uv0, _Diffuse2));
                float4 _Diffuse3_var = tex2D(_Diffuse3,TRANSFORM_TEX(i.uv0, _Diffuse3));
                float3 finalColor = ((_Color.rgb*(lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*(lerp( lerp( lerp( _Diffuse4_var.rgb, _Diffuse_var.rgb, _BlendMap_var.rgb.r ), _Diffuse2_var.rgb, _BlendMap_var.rgb.g ), _Diffuse3_var.rgb, _BlendMap_var.rgb.b ))))*_LightColor0.rgb*(attenuation*0.5+0.5));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
