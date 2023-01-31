// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33764,y:32591,varname:node_9361,prsc:2|custl-4225-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32992,y:33012,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:5927,x:33172,y:32702,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2644,x:32757,y:32852,ptovrint:False,ptlb:LightMap,ptin:_LightMap,varname:node_9622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False|UVIN-4599-UVOUT;n:type:ShaderForge.SFN_Lerp,id:9981,x:32992,y:32852,varname:node_9981,prsc:2|A-2644-RGB,B-607-OUT,T-2644-RGB;n:type:ShaderForge.SFN_ValueProperty,id:607,x:32757,y:32748,ptovrint:False,ptlb:LightMap_Pow,ptin:_LightMap_Pow,varname:node_1949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.7;n:type:ShaderForge.SFN_TexCoord,id:4599,x:32574,y:32852,varname:node_4599,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6144,x:33172,y:32852,varname:node_6144,prsc:2|A-9981-OUT,B-851-RGB;n:type:ShaderForge.SFN_Multiply,id:2601,x:33364,y:32831,varname:node_2601,prsc:2|A-5927-RGB,B-6144-OUT;n:type:ShaderForge.SFN_LightColor,id:2738,x:33172,y:33012,varname:node_2738,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4225,x:33571,y:32831,cmnt:Attenuate and Color,varname:node_4225,prsc:2|A-2601-OUT,B-4255-OUT,C-3134-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:3134,x:33364,y:33197,varname:node_3134,prsc:2;n:type:ShaderForge.SFN_ConstantLerp,id:4255,x:33364,y:33012,varname:node_4255,prsc:2,a:0.25,b:1|IN-2738-RGB;proporder:607-5927-2644-851;pass:END;sub:END;*/

Shader "BGShader/BG_Blinn_Lowest" {
    Properties {
        _LightMap_Pow ("LightMap_Pow", Float ) = 1.7
        _Color ("Color", Color) = (1,1,1,1)
        _LightMap ("LightMap", 2D) = "gray" {}
        _MainTex ("MainTex", 2D) = "white" {}
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
            uniform sampler2D _LightMap; uniform float4 _LightMap_ST;
            uniform float _LightMap_Pow;
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = ((_Color.rgb*(lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*_MainTex_var.rgb))*lerp(0.25,1,_LightColor0.rgb)*attenuation);
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
            uniform sampler2D _LightMap; uniform float4 _LightMap_ST;
            uniform float _LightMap_Pow;
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = ((_Color.rgb*(lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*_MainTex_var.rgb))*lerp(0.25,1,_LightColor0.rgb)*attenuation);
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
