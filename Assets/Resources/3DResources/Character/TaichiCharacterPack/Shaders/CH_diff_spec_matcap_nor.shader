// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.33 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.33;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:1,spmd:1,trmd:0,grmd:1,uamb:True,mssp:False,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:36619,y:32087,varname:node_4013,prsc:2|diff-4417-OUT,spec-2196-OUT,gloss-3570-OUT,normal-272-RGB,emission-624-OUT,amdfl-6949-OUT,amspl-6949-OUT,difocc-5079-OUT,spcocc-6857-OUT,clip-7675-A;n:type:ShaderForge.SFN_NormalVector,id:7557,x:31516,y:31774,prsc:2,pt:True;n:type:ShaderForge.SFN_HalfVector,id:3560,x:32696,y:31079,varname:node_3560,prsc:2;n:type:ShaderForge.SFN_Dot,id:3524,x:33179,y:30877,cmnt:Blinn-Phong,varname:node_3524,prsc:2,dt:1|A-1261-XYZ,B-3560-OUT;n:type:ShaderForge.SFN_Multiply,id:1755,x:34836,y:32157,cmnt:Specular Contribution,varname:node_1755,prsc:2|A-6473-OUT,B-6512-OUT;n:type:ShaderForge.SFN_Tex2d,id:7675,x:34117,y:31955,ptovrint:False,ptlb:Diff_tex,ptin:_Diff_tex,varname:_Dif_tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:2491,x:33992,y:32243,ptovrint:False,ptlb:Diff_Color,ptin:_Diff_Color,varname:_Dif_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5438,x:32566,y:32975,ptovrint:False,ptlb:Spec Color,ptin:_SpecColor,varname:_SpecColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1186,x:34314,y:32224,cmnt:Diffuse Color,varname:node_1186,prsc:2|A-7675-RGB,B-2491-RGB;n:type:ShaderForge.SFN_Fresnel,id:4757,x:33179,y:31089,varname:node_4757,prsc:2|NRM-7557-OUT,EXP-5590-OUT;n:type:ShaderForge.SFN_Slider,id:5590,x:32854,y:31312,ptovrint:False,ptlb:Rim_width,ptin:_Rim_width,varname:_Rim_width,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:15;n:type:ShaderForge.SFN_Multiply,id:4931,x:33443,y:31088,varname:node_4931,prsc:2|A-4757-OUT,B-4791-OUT;n:type:ShaderForge.SFN_Slider,id:4791,x:33420,y:31274,ptovrint:False,ptlb:Rim_intensity,ptin:_Rim_intensity,varname:_Rim_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.079921,max:15;n:type:ShaderForge.SFN_Multiply,id:4311,x:33865,y:31089,varname:node_4311,prsc:2|A-4931-OUT,B-3640-RGB;n:type:ShaderForge.SFN_Color,id:3640,x:33447,y:31435,ptovrint:False,ptlb:Rim_color,ptin:_Rim_color,varname:_Rim_color,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.243458,c2:0.3173562,c3:0.4191176,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1979,x:32956,y:33029,ptovrint:False,ptlb:Spec_tex,ptin:_Spec_tex,varname:_Spec_tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7087,x:34451,y:33022,varname:node_7087,prsc:2|A-1979-G,B-2155-OUT;n:type:ShaderForge.SFN_Slider,id:7740,x:32488,y:32830,ptovrint:False,ptlb:Spec_intensity,ptin:_Spec_intensity,varname:_Spec_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:7724,x:34344,y:30870,varname:node_7724,prsc:2|A-3524-OUT,B-4311-OUT;n:type:ShaderForge.SFN_Transform,id:1261,x:32696,y:30876,varname:node_1261,prsc:2,tffrom:0,tfto:1|IN-7557-OUT;n:type:ShaderForge.SFN_Multiply,id:3799,x:32956,y:32829,varname:node_3799,prsc:2|A-7740-OUT,B-5438-RGB;n:type:ShaderForge.SFN_Add,id:156,x:34967,y:31222,varname:node_156,prsc:2|A-7724-OUT,B-7782-OUT;n:type:ShaderForge.SFN_Transform,id:5075,x:31705,y:32368,cmnt:MatCap,varname:node_5075,prsc:2,tffrom:0,tfto:3|IN-7557-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9061,x:31924,y:32368,varname:node_9061,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5075-XYZ;n:type:ShaderForge.SFN_Tex2d,id:5206,x:32352,y:32368,ptovrint:False,ptlb:Matcap_tex,ptin:_Matcap_tex,varname:_Matcap_tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5626-OUT;n:type:ShaderForge.SFN_RemapRange,id:5626,x:32125,y:32368,varname:node_5626,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9061-OUT;n:type:ShaderForge.SFN_Multiply,id:9318,x:32677,y:32389,varname:node_9318,prsc:2|A-5206-R,B-9923-OUT;n:type:ShaderForge.SFN_Slider,id:9923,x:32239,y:32602,ptovrint:False,ptlb:Matcap_intensity,ptin:_Matcap_intensity,varname:_Mmatcap_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:6473,x:32949,y:32391,varname:node_6473,prsc:2|A-9318-OUT,B-4512-RGB;n:type:ShaderForge.SFN_Color,id:4512,x:32903,y:32583,ptovrint:False,ptlb:Matcap_color,ptin:_Matcap_color,varname:_Matcap_color,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3897059,c2:0.3473758,c3:0.2091804,c4:1;n:type:ShaderForge.SFN_Add,id:9678,x:34755,y:32999,varname:node_9678,prsc:2|A-7087-OUT,B-1186-OUT;n:type:ShaderForge.SFN_Multiply,id:5261,x:35056,y:31910,varname:node_5261,prsc:2|A-7675-RGB,B-1755-OUT;n:type:ShaderForge.SFN_Tex2d,id:272,x:36252,y:31881,ptovrint:False,ptlb:Normal_tex,ptin:_Normal_tex,varname:_Normal_tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:4417,x:35442,y:32967,varname:node_4417,prsc:2|A-9678-OUT,B-4035-OUT,T-3117-OUT;n:type:ShaderForge.SFN_Lerp,id:2196,x:35614,y:31950,varname:node_2196,prsc:2|A-1755-OUT,B-5261-OUT,T-2193-OUT;n:type:ShaderForge.SFN_Slider,id:3570,x:36095,y:31734,ptovrint:False,ptlb:Spec_gloss,ptin:_Spec_gloss,varname:_Spec_gloss,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:6512,x:33589,y:32828,varname:node_6512,prsc:2|A-3799-OUT,B-1979-R;n:type:ShaderForge.SFN_ChannelBlend,id:4035,x:35143,y:32779,varname:node_4035,prsc:2,chbt:0|M-7675-RGB,R-9678-OUT,G-9678-OUT,B-9678-OUT;n:type:ShaderForge.SFN_AmbientLight,id:7916,x:36117,y:32947,varname:node_7916,prsc:2;n:type:ShaderForge.SFN_Slider,id:5079,x:35586,y:32540,ptovrint:False,ptlb:Ambient_dif_intensity,ptin:_Ambient_dif_intensity,varname:_Ambient_dif_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9,max:1;n:type:ShaderForge.SFN_Multiply,id:6949,x:36578,y:32947,varname:node_6949,prsc:2|A-8621-OUT,B-5750-OUT;n:type:ShaderForge.SFN_Slider,id:5750,x:36327,y:33203,ptovrint:False,ptlb:Ambient_intensity,ptin:_Ambient_intensity,varname:_Ambient_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9,max:1;n:type:ShaderForge.SFN_Slider,id:6857,x:35640,y:32378,ptovrint:False,ptlb:Ambient_spec_intensity,ptin:_Ambient_spec_intensity,varname:_Ambient_spec_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_Color,id:4881,x:36117,y:33101,ptovrint:False,ptlb:Ambient_Color,ptin:_Ambient_Color,varname:_Ambient_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8621,x:36362,y:33004,varname:node_8621,prsc:2|A-7916-RGB,B-4881-RGB;n:type:ShaderForge.SFN_Slider,id:1061,x:34243,y:31178,ptovrint:False,ptlb:Emission_intensity,ptin:_Emission_intensity,varname:_Eemission_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1,max:1;n:type:ShaderForge.SFN_Multiply,id:7782,x:34588,y:31247,varname:node_7782,prsc:2|A-1061-OUT,B-7675-RGB;n:type:ShaderForge.SFN_AmbientLight,id:6899,x:34746,y:31469,varname:node_6899,prsc:2;n:type:ShaderForge.SFN_Multiply,id:624,x:35188,y:31348,varname:node_624,prsc:2|A-156-OUT,B-3294-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:3294,x:34976,y:31469,varname:node_3294,prsc:2,min:0.2,max:0.8|IN-6899-RGB;n:type:ShaderForge.SFN_Vector1,id:2155,x:33414,y:33323,varname:node_2155,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:2193,x:35383,y:32155,varname:node_2193,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:3117,x:35110,y:33063,varname:node_3117,prsc:2,v1:0;proporder:2491-7675-5438-1979-7740-3570-4512-5206-9923-272-3640-5590-4791-4881-5750-5079-6857-1061;pass:END;sub:END;*/

Shader "CHShader/diff_spec_matcap_normal" {
    Properties {
        _Diff_Color ("Diff_Color", Color) = (0.5,0.5,0.5,1)
        _Diff_tex ("Diff_tex", 2D) = "white" {}
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
        _Spec_tex ("Spec_tex", 2D) = "white" {}
        _Spec_intensity ("Spec_intensity", Range(0, 10)) = 1
        _Spec_gloss ("Spec_gloss", Range(0, 1)) = 0
        _Matcap_color ("Matcap_color", Color) = (0.3897059,0.3473758,0.2091804,1)
        _Matcap_tex ("Matcap_tex", 2D) = "white" {}
        _Matcap_intensity ("Matcap_intensity", Range(0, 10)) = 1
        _Normal_tex ("Normal_tex", 2D) = "bump" {}
        _Rim_color ("Rim_color", Color) = (0.243458,0.3173562,0.4191176,1)
        _Rim_width ("Rim_width", Range(0, 15)) = 1
        _Rim_intensity ("Rim_intensity", Range(0, 15)) = 3.079921
        _Ambient_Color ("Ambient_Color", Color) = (1,1,1,1)
        _Ambient_intensity ("Ambient_intensity", Range(0, 1)) = 0.9
        _Ambient_dif_intensity ("Ambient_dif_intensity", Range(0, 1)) = 0.9
        _Ambient_spec_intensity ("Ambient_spec_intensity", Range(0, 1)) = 0.1
        _Emission_intensity ("Emission_intensity", Range(0, 1)) = 0.1
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 2.0
            uniform float4 _LightColor0;
            uniform sampler2D _Diff_tex; uniform float4 _Diff_tex_ST;
            uniform float4 _Diff_Color;
            uniform float4 _SpecColor;
            uniform fixed _Rim_width;
            uniform fixed _Rim_intensity;
            uniform half4 _Rim_color;
            uniform sampler2D _Spec_tex; uniform float4 _Spec_tex_ST;
            uniform fixed _Spec_intensity;
            uniform sampler2D _Matcap_tex; uniform float4 _Matcap_tex_ST;
            uniform fixed _Matcap_intensity;
            uniform fixed4 _Matcap_color;
            uniform sampler2D _Normal_tex; uniform float4 _Normal_tex_ST;
            uniform fixed _Spec_gloss;
            uniform fixed _Ambient_dif_intensity;
            uniform fixed _Ambient_intensity;
            uniform fixed _Ambient_spec_intensity;
            uniform float4 _Ambient_Color;
            uniform fixed _Emission_intensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_tex_var = UnpackNormal(tex2D(_Normal_tex,TRANSFORM_TEX(i.uv0, _Normal_tex)));
                float3 normalLocal = _Normal_tex_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _Diff_tex_var = tex2D(_Diff_tex,TRANSFORM_TEX(i.uv0, _Diff_tex));
                clip(_Diff_tex_var.a - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 1.0 - _Spec_gloss; // Convert roughness to gloss
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularAO = _Ambient_spec_intensity;
                float3 node_6949 = ((UNITY_LIGHTMODEL_AMBIENT.rgb*_Ambient_Color.rgb)*_Ambient_intensity);
                float2 node_5626 = (mul( UNITY_MATRIX_V, float4(normalDirection,0) ).xyz.rgb.rg*0.5+0.5);
                float4 _Matcap_tex_var = tex2D(_Matcap_tex,TRANSFORM_TEX(node_5626, _Matcap_tex));
                float4 _Spec_tex_var = tex2D(_Spec_tex,TRANSFORM_TEX(i.uv0, _Spec_tex));
                float3 node_1755 = (((_Matcap_tex_var.r*_Matcap_intensity)*_Matcap_color.rgb)*((_Spec_intensity*_SpecColor.rgb)*_Spec_tex_var.r)); // Specular Contribution
                float3 specularColor = lerp(node_1755,(_Diff_tex_var.rgb*node_1755),0.0);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 indirectSpecular = (0 + node_6949) * specularAO*specularColor;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += node_6949; // Diffuse Ambient Light
                indirectDiffuse *= _Ambient_dif_intensity; // Diffuse AO
                float3 node_9678 = ((_Spec_tex_var.g*0.0)+(_Diff_tex_var.rgb*_Diff_Color.rgb));
                float3 diffuseColor = lerp(node_9678,(_Diff_tex_var.rgb.r*node_9678 + _Diff_tex_var.rgb.g*node_9678 + _Diff_tex_var.rgb.b*node_9678),0.0);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (((max(0,dot(mul( unity_WorldToObject, float4(normalDirection,0) ).xyz.rgb,halfDirection))*((pow(1.0-max(0,dot(normalDirection, viewDirection)),_Rim_width)*_Rim_intensity)*_Rim_color.rgb))+(_Emission_intensity*_Diff_tex_var.rgb))*clamp(UNITY_LIGHTMODEL_AMBIENT.rgb,0.2,0.8));
/// Final Color:
				#pragma target 3.0
                float3 finalColor = diffuse + specular + emissive;
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
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 2.0
            uniform sampler2D _Diff_tex; uniform float4 _Diff_tex_ST;
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
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _Diff_tex_var = tex2D(_Diff_tex,TRANSFORM_TEX(i.uv0, _Diff_tex));
                clip(_Diff_tex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
