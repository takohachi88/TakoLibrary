Shader "Hidden/TakoLib/PostProcess/RadialBlur"
{
    SubShader
    {
        Tags
        {
            "RenderPipeline" = "UniversalRenderPipeline"
        }       
        ZWrite Off
        Cull Off
        ZTest Always

        Pass
        {            
            HLSLPROGRAM
            #pragma vertex Vert
            #pragma fragment Fragment

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.core/Runtime/Utilities/Blit.hlsl"

            half _Intensity;

            half4 Fragment (Varyings input) : SV_Target
            {
                half4 output = SAMPLE_TEXTURE2D(_BlitTexture, sampler_LinearClamp, input.texcoord);
                output.rgb = lerp(output.rgb, 1 - output.rgb, _Intensity);
                return output;
            }
            
            ENDHLSL
        }
    }
}
