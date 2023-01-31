// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:1,spmd:1,trmd:0,grmd:1,uamb:True,mssp:False,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:False,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3391544,fgcg:0.7640719,fgcb:0.9044118,fgca:0,fgde:0.0025,fgrn:700,fgrf:1500,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:37055,y:32046,varname:node_4013,prsc:2|diff-4417-OUT,spec-2196-OUT,gloss-3570-OUT,normal-272-RGB,emission-7946-OUT,difocc-5079-OUT,clip-4925-OUT;n:type:ShaderForge.SFN_Tex2d,id:7675,x:35719,y:32298,ptovrint:False,ptlb:Diff_tex,ptin:_Diff_tex,varname:_Dif_tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:2491,x:31899,y:32518,ptovrint:False,ptlb:Diff_Color,ptin:_Diff_Color,varname:_Dif_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5438,x:32566,y:32975,ptovrint:False,ptlb:Spec Color,ptin:_SpecColor,varname:_SpecColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1186,x:34595,y:33181,cmnt:Diffuse Color,varname:node_1186,prsc:2|A-7675-RGB,B-2491-RGB;n:type:ShaderForge.SFN_Tex2d,id:1979,x:32956,y:33029,ptovrint:False,ptlb:Spec_tex,ptin:_Spec_tex,varname:_Spec_tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7087,x:34451,y:33022,varname:node_7087,prsc:2|A-1979-G,B-2155-OUT;n:type:ShaderForge.SFN_Slider,id:7740,x:32488,y:32830,ptovrint:False,ptlb:Spec_intensity,ptin:_Spec_intensity,varname:_Spec_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:3799,x:32956,y:32829,varname:node_3799,prsc:2|A-7740-OUT,B-5438-RGB;n:type:ShaderForge.SFN_Add,id:9678,x:34852,y:33108,varname:node_9678,prsc:2|A-7087-OUT,B-1186-OUT;n:type:ShaderForge.SFN_Tex2d,id:272,x:36336,y:31509,ptovrint:False,ptlb:Normal_tex,ptin:_Normal_tex,varname:_Normal_tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:4417,x:35493,y:32970,varname:node_4417,prsc:2|A-9678-OUT,B-4035-OUT,T-3117-OUT;n:type:ShaderForge.SFN_Lerp,id:2196,x:35614,y:31950,varname:node_2196,prsc:2|A-6512-OUT,B-7675-RGB,T-2193-OUT;n:type:ShaderForge.SFN_Slider,id:3570,x:36307,y:31335,ptovrint:False,ptlb:Spec_gloss,ptin:_Spec_gloss,varname:_Spec_gloss,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:6512,x:33589,y:32828,varname:node_6512,prsc:2|A-3799-OUT,B-1979-R;n:type:ShaderForge.SFN_ChannelBlend,id:4035,x:35156,y:33063,varname:node_4035,prsc:2,chbt:0|M-7675-RGB,R-9678-OUT,G-9678-OUT,B-9678-OUT;n:type:ShaderForge.SFN_Slider,id:5079,x:36868,y:32825,ptovrint:False,ptlb:Ambient_dif_intensity,ptin:_Ambient_dif_intensity,varname:_Ambient_dif_intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9,max:1;n:type:ShaderForge.SFN_Vector1,id:2155,x:33414,y:33323,varname:node_2155,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:2193,x:35383,y:32155,varname:node_2193,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:3117,x:35236,y:33368,varname:node_3117,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:7946,x:36173,y:32520,ptovrint:False,ptlb:dissolve,ptin:_dissolve,varname:node_7946,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_ComponentMask,id:604,x:36600,y:32272,varname:node_604,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8620-OUT;n:type:ShaderForge.SFN_Step,id:8620,x:36330,y:32267,varname:node_8620,prsc:2|A-7675-RGB,B-7946-OUT;n:type:ShaderForge.SFN_RemapRange,id:4925,x:36805,y:32294,varname:node_4925,prsc:2,frmn:0,frmx:1,tomn:1,tomx:-1|IN-604-OUT;proporder:2491-7675-5438-1979-7740-3570-272-5079-7946;pass:END;sub:END;*/

Shader "CHShader/diff_spec_normal" {
    Properties {
        _Diff_Color ("Diff_Color", Color) = (0.5,0.5,0.5,1)
        _Diff_tex ("Diff_tex", 2D) = "white" {}
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
        _Spec_tex ("Spec_tex", 2D) = "white" {}
        _Spec_intensity ("Spec_intensity", Range(0, 10)) = 1
        _Spec_gloss ("Spec_gloss", Range(0, 1)) = 0
        _Normal_tex ("Normal_tex", 2D) = "bump" {}
        _Ambient_dif_intensity ("Ambient_dif_intensity", Range(0, 1)) = 0.9
        _dissolve ("dissolve", Range(0, 1)) = 0
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
            uniform sampler2D _Spec_tex; uniform float4 _Spec_tex_ST;
            uniform fixed _Spec_intensity;
            uniform sampler2D _Normal_tex; uniform float4 _Normal_tex_ST;
            uniform fixed _Spec_gloss;
            uniform fixed _Ambient_dif_intensity;
            uniform float _dissolve;
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
                o.pos = UnityObjectToClipPos( v.vertex );
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
                clip((step(_Diff_tex_var.rgb,_dissolve).r*-2.0+1.0) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 1.0 - _Spec_gloss; // Convert roughness to gloss
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float4 _Spec_tex_var = tex2D(_Spec_tex,TRANSFORM_TEX(i.uv0, _Spec_tex));
                float3 specularColor = lerp(((_Spec_intensity*_SpecColor.rgb)*_Spec_tex_var.r),_Diff_tex_var.rgb,0.0);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse *= _Ambient_dif_intensity; // Diffuse AO
                float3 node_9678 = ((_Spec_tex_var.g*0.0)+(_Diff_tex_var.rgb*_Diff_Color.rgb));
                float3 diffuseColor = lerp(node_9678,(_Diff_tex_var.rgb.r*node_9678 + _Diff_tex_var.rgb.g*node_9678 + _Diff_tex_var.rgb.b*node_9678),0.0);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = float3(_dissolve,_dissolve,_dissolve);
/// Final Color:
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
            Cull Back
            
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
            uniform float _dissolve;
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
            float4 frag(VertexOutput i) : COLOR {
                float4 _Diff_tex_var = tex2D(_Diff_tex,TRANSFORM_TEX(i.uv0, _Diff_tex));
                clip((step(_Diff_tex_var.rgb,_dissolve).r*-2.0+1.0) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
