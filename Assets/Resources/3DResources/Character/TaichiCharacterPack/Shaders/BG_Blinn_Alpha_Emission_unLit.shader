// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33764,y:32591,varname:node_9361,prsc:2|emission-3170-OUT,custl-2601-OUT,clip-851-A;n:type:ShaderForge.SFN_Tex2d,id:851,x:32853,y:33002,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:5927,x:33073,y:32681,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2644,x:32520,y:32849,ptovrint:False,ptlb:LightMap,ptin:_LightMap,varname:node_9622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False|UVIN-4599-UVOUT;n:type:ShaderForge.SFN_Lerp,id:9981,x:32853,y:32850,varname:node_9981,prsc:2|A-2644-RGB,B-607-OUT,T-2644-RGB;n:type:ShaderForge.SFN_ValueProperty,id:607,x:32520,y:32749,ptovrint:False,ptlb:LightMap_Pow,ptin:_LightMap_Pow,varname:node_1949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.7;n:type:ShaderForge.SFN_TexCoord,id:4599,x:32327,y:32849,varname:node_4599,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6144,x:33073,y:32850,varname:node_6144,prsc:2|A-9981-OUT,B-851-RGB;n:type:ShaderForge.SFN_Multiply,id:2601,x:33295,y:32830,varname:node_2601,prsc:2|A-5927-RGB,B-6144-OUT;n:type:ShaderForge.SFN_Tex2d,id:1323,x:33486,y:32194,ptovrint:False,ptlb:emission,ptin:_emission,varname:_Diffuse_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:3170,x:33684,y:32176,varname:node_3170,prsc:2|A-1323-RGB,B-2940-OUT,T-1323-RGB;n:type:ShaderForge.SFN_Time,id:4308,x:32940,y:31999,varname:node_4308,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8562,x:33125,y:31999,varname:node_8562,prsc:2|A-7406-OUT,B-4308-T;n:type:ShaderForge.SFN_ValueProperty,id:7406,x:32940,y:31935,ptovrint:False,ptlb:emission speed,ptin:_emissionspeed,varname:node_7599,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Sin,id:8832,x:33312,y:31999,varname:node_8832,prsc:2|IN-8562-OUT;n:type:ShaderForge.SFN_RemapRange,id:2940,x:33486,y:31999,varname:node_2940,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8832-OUT;proporder:607-5927-2644-851-1323-7406;pass:END;sub:END;*/

Shader "BGShader/BG_Blinn_Alpha_Emission_unLit" {
    Properties {
        _LightMap_Pow ("LightMap_Pow", Float ) = 1.7
        _Color ("Color", Color) = (1,1,1,1)
        _LightMap ("LightMap", 2D) = "gray" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _emission ("emission", 2D) = "white" {}
        _emissionspeed ("emission speed", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu 
            #pragma target 2.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
            uniform sampler2D _LightMap; uniform float4 _LightMap_ST;
            uniform float _LightMap_Pow;
            uniform sampler2D _emission; uniform float4 _emission_ST;
            uniform float _emissionspeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
////// Lighting:
////// Emissive:
                float4 _emission_var = tex2D(_emission,TRANSFORM_TEX(i.uv0, _emission));
                float4 node_4308 = _Time;
                float node_2940 = (sin((_emissionspeed*node_4308.g))*0.5+0.5);
                float3 emissive = lerp(_emission_var.rgb,float3(node_2940,node_2940,node_2940),_emission_var.rgb);
                float4 _LightMap_var = tex2D(_LightMap,TRANSFORM_TEX(i.uv1, _LightMap));
                float3 finalColor = emissive + (_Color.rgb*(lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*_MainTex_var.rgb));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal n3ds wiiu 
            #pragma target 2.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
