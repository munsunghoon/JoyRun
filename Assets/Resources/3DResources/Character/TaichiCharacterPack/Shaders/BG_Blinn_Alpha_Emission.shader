// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33764,y:32591,varname:node_9361,prsc:2|emission-3170-OUT,custl-5697-OUT,clip-7907-OUT,voffset-268-OUT;n:type:ShaderForge.SFN_Tex2d,id:851,x:32929,y:33024,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:5927,x:33124,y:32693,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2644,x:32723,y:32850,ptovrint:False,ptlb:LightMap,ptin:_LightMap,varname:node_9622,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:1,isnm:False|UVIN-4599-UVOUT;n:type:ShaderForge.SFN_Lerp,id:9981,x:32929,y:32850,varname:node_9981,prsc:2|A-2644-RGB,B-607-OUT,T-2644-RGB;n:type:ShaderForge.SFN_ValueProperty,id:607,x:32723,y:32765,ptovrint:False,ptlb:LightMap_Pow,ptin:_LightMap_Pow,varname:node_1949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.7;n:type:ShaderForge.SFN_TexCoord,id:4599,x:32549,y:32850,varname:node_4599,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6144,x:33124,y:32850,varname:node_6144,prsc:2|A-9981-OUT,B-851-RGB;n:type:ShaderForge.SFN_Multiply,id:2601,x:33316,y:32830,varname:node_2601,prsc:2|A-5927-RGB,B-6144-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3386,x:32537,y:33249,ptovrint:False,ptlb:Move,ptin:_Move,varname:node_8439,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:999,x:32830,y:33249,varname:node_999,prsc:2|A-3386-OUT,B-2397-OUT;n:type:ShaderForge.SFN_Vector1,id:2397,x:32537,y:33321,varname:node_2397,prsc:2,v1:1;n:type:ShaderForge.SFN_VertexColor,id:2385,x:32461,y:33447,varname:node_2385,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9476,x:33023,y:33504,varname:node_9476,prsc:2|A-999-OUT,B-2385-A,C-4366-OUT;n:type:ShaderForge.SFN_Time,id:3783,x:32464,y:33744,varname:node_3783,prsc:2;n:type:ShaderForge.SFN_Sin,id:4366,x:32836,y:33784,varname:node_4366,prsc:2|IN-1672-OUT;n:type:ShaderForge.SFN_Multiply,id:1672,x:32671,y:33784,varname:node_1672,prsc:2|A-2385-A,B-3783-TTR;n:type:ShaderForge.SFN_Append,id:89,x:33438,y:33504,varname:node_89,prsc:2|A-2472-OUT,B-8497-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2472,x:33209,y:33504,varname:node_2472,prsc:2,cc1:0,cc2:0,cc3:-1,cc4:-1|IN-9476-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:268,x:33591,y:33363,ptovrint:False,ptlb:WindAni,ptin:_WindAni,varname:node_4086,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8497-OUT,B-89-OUT;n:type:ShaderForge.SFN_Vector1,id:8497,x:33249,y:33364,varname:node_8497,prsc:2,v1:0;n:type:ShaderForge.SFN_LightColor,id:5978,x:33316,y:32969,varname:node_5978,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5697,x:33531,y:32830,cmnt:Attenuate and Color,varname:node_5697,prsc:2|A-2601-OUT,B-5978-RGB,C-4587-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:4587,x:33316,y:33103,varname:node_4587,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:1323,x:33123,y:32239,ptovrint:False,ptlb:emission,ptin:_emission,varname:_Diffuse_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:3170,x:33301,y:32411,varname:node_3170,prsc:2|A-1323-RGB,B-2940-OUT,T-1323-RGB;n:type:ShaderForge.SFN_Time,id:4308,x:32579,y:32475,varname:node_4308,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8562,x:32761,y:32411,varname:node_8562,prsc:2|A-7406-OUT,B-4308-T;n:type:ShaderForge.SFN_ValueProperty,id:7406,x:32579,y:32411,ptovrint:False,ptlb:emission speed,ptin:_emissionspeed,varname:node_7599,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Sin,id:8832,x:32943,y:32411,varname:node_8832,prsc:2|IN-8562-OUT;n:type:ShaderForge.SFN_RemapRange,id:2940,x:33123,y:32411,varname:node_2940,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8832-OUT;n:type:ShaderForge.SFN_Relay,id:7907,x:33375,y:33231,varname:node_7907,prsc:2|IN-851-A;proporder:607-5927-2644-851-3386-268-1323-7406;pass:END;sub:END;*/

Shader "BGShader/BG_Blinn_Alpha_Emission" {
    Properties {
        _LightMap_Pow ("LightMap_Pow", Float ) = 1.7
        _Color ("Color", Color) = (1,1,1,1)
        _LightMap ("LightMap", 2D) = "gray" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _Move ("Move", Float ) = 0.5
        [MaterialToggle] _WindAni ("WindAni", Float ) = 0
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
            uniform float _Move;
            uniform fixed _WindAni;
            uniform sampler2D _emission; uniform float4 _emission_ST;
            uniform float _emissionspeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                float node_8497 = 0.0;
                float4 node_3783 = _Time;
                v.vertex.xyz += lerp( node_8497, float3(((_Move*1.0)*o.vertexColor.a*sin((o.vertexColor.a*node_3783.a))).rr,node_8497), _WindAni );
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _emission_var = tex2D(_emission,TRANSFORM_TEX(i.uv0, _emission));
                float4 node_4308 = _Time;
                float node_2940 = (sin((_emissionspeed*node_4308.g))*0.5+0.5);
                float3 emissive = lerp(_emission_var.rgb,float3(node_2940,node_2940,node_2940),_emission_var.rgb);
                float4 _LightMap_var = tex2D(_LightMap,TRANSFORM_TEX(i.uv1, _LightMap));
                float3 finalColor = emissive + ((_Color.rgb*(lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*_MainTex_var.rgb))*_LightColor0.rgb*attenuation);
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
            Cull Off
            
            
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
            uniform float _Move;
            uniform fixed _WindAni;
            uniform sampler2D _emission; uniform float4 _emission_ST;
            uniform float _emissionspeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                float node_8497 = 0.0;
                float4 node_3783 = _Time;
                v.vertex.xyz += lerp( node_8497, float3(((_Move*1.0)*o.vertexColor.a*sin((o.vertexColor.a*node_3783.a))).rr,node_8497), _WindAni );
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _LightMap_var = tex2D(_LightMap,TRANSFORM_TEX(i.uv1, _LightMap));
                float3 finalColor = ((_Color.rgb*(lerp(_LightMap_var.rgb,float3(_LightMap_Pow,_LightMap_Pow,_LightMap_Pow),_LightMap_var.rgb)*_MainTex_var.rgb))*_LightColor0.rgb*attenuation);
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            uniform float _Move;
            uniform fixed _WindAni;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float node_8497 = 0.0;
                float4 node_3783 = _Time;
                v.vertex.xyz += lerp( node_8497, float3(((_Move*1.0)*o.vertexColor.a*sin((o.vertexColor.a*node_3783.a))).rr,node_8497), _WindAni );
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
