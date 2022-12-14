import    d3d9,\
          Direct3DCreate9, 'Direct3DCreate9'

import    d3dx9,\
          D3DXMatrixIdentity, 'D3DXMatrixIdentity',\
          D3DXMatrixTranslation, 'D3DXMatrixTranslation',\
          D3DXMatrixScaling, 'D3DXMatrixScaling',\
          D3DXMatrixRotationX, 'D3DXMatrixRotationX',\
          D3DXMatrixRotationY, 'D3DXMatrixRotationY',\
          D3DXMatrixRotationZ, 'D3DXMatrixRotationZ',\
          D3DXMatrixLookAtLH, 'D3DXMatrixLookAtLH',\
          D3DXMatrixPerspectiveFovLH, 'D3DXMatrixPerspectiveFovLH'

interface IDirect3D9,\
          QueryInterface,\
          AddRef,\
          Release,\
          RegisterSoftwareDevice,\
          GetAdapterCount,\
          GetAdapterIdentifier,\
          GetAdapterModeCount,\
          EnumAdapterModes,\
          GetAdapterDisplayMode,\
          CheckDeviceType,\
          CheckDeviceFormat,\
          CheckDeviceMultiSampleType,\
          CheckDepthStencilMatch,\
          CheckDeviceFormatConversion,\
          GetDeviceCaps,\
          GetAdapterMonitor,\
          CreateDevice

interface IDirect3DDevice9,\
          QueryInterface,\
          AddRef,\
          Release,\
          TestCooperativeLevel,\
          GetAvailableTextureMem,\
          EvictManagedResources,\
          GetDirect3D,\
          GetDeviceCaps,\
          GetDisplayMode,\
          GetCreationParameters,\
          SetCursorProperties,\
          SetCursorPosition,\
          ShowCursor,\
          CreateAdditionalSwapChain,\
          GetSwapChain,\
          GetNumberOfSwapChains,\
          Reset,\
          Present,\
          GetBackBuffer,\
          GetRasterStatus,\
          SetDialogBoxMode,\
          SetGammaRamp,\
          GetGammaRamp,\
          CreateTexture,\
          CreateVolumeTexture,\
          CreateCubeTexture,\
          CreateVertexBuffer,\
          CreateIndexBuffer,\
          CreateRenderTarget,\
          CreateDepthStencilSurface,\
          UpdateSurface,\
          UpdateTexture,\
          GetRenderTargetData,\
          GetFrontBufferData,\
          StretchRect,\
          ColorFill,\
          CreateOffscreenPlainSurface,\
          SetRenderTarget,\
          GetRenderTarget,\
          SetDepthStencilSurface,\
          GetDepthStencilSurface,\
          BeginScene,\
          EndScene,\
          Clear,\
          SetTransform,\
          GetTransform,\
          MultiplyTransform,\
          SetViewport,\
          GetViewport,\
          SetMaterial,\
          GetMaterial,\
          SetLight,\
          GetLight,\
          LightEnable,\
          GetLightEnable,\
          SetClipPlane,\
          GetClipPlane,\
          SetRenderState,\
          GetRenderState,\
          CreateStateBlock,\
          BeginStateBlock,\
          EndStateBlock,\
          SetClipStatus,\
          GetClipStatus,\
          GetTexture,\
          SetTexture,\
          GetTextureStageState,\
          SetTextureStageState,\
          GetSamplerState,\
          SetSamplerState,\
          ValidateDevice,\
          SetPaletteEntries,\
          GetPaletteEntries,\
          SetCurrentTexturePalette,\
          GetCurrentTexturePalette,\
          SetScissorRect,\
          GetScissorRect,\
          SetSoftwareVertexProcessing,\
          GetSoftwareVertexProcessing,\
          SetNPatchMode,\
          GetNPatchMode,\
          DrawPrimitive,\
          DrawIndexedPrimitive,\
          DrawPrimitiveUP,\
          DrawIndexedPrimitiveUP,\
          ProcessVertices,\
          CreateVertexDeclaration,\
          SetVertexDeclaration,\
          GetVertexDeclaration,\
          SetFVF,\
          GetFVF,\
          CreateVertexShader,\
          SetVertexShader,\
          GetVertexShader,\
          SetVertexShaderConstantF,\
          GetVertexShaderConstantF,\
          SetVertexShaderConstantI,\
          GetVertexShaderConstantI,\
          SetVertexShaderConstantB,\
          GetVertexShaderConstantB,\
          SetStreamSource,\
          GetStreamSource,\
          SetStreamSourceFreq,\
          GetStreamSourceFreq,\
          SetIndices,\
          GetIndices,\
          CreatePixelShader,\
          SetPixelShader,\
          GetPixelShader,\
          SetPixelShaderConstantF,\
          GetPixelShaderConstantF,\
          SetPixelShaderConstantI,\
          GetPixelShaderConstantI,\
          SetPixelShaderConstantB,\
          GetPixelShaderConstantB,\
          DrawRectPatch,\
          DrawTriPatch,\
          DeletePatch,\
          CreateQuery

interface IDirect3DVertexBuffer9,\
          QueryInterface,\
          AddRef,\
          Release,\
          GetDevice,\
          SetPrivateData,\
          GetPrivateData,\
          FreePrivateData,\
          SetPriority,\
          GetPriority,\
          PreLoad,\
          GetType,\
          Lock,\
          Unlock,\
          GetDesc

interface IDirect3DIndexBuffer9,\
          QueryInterface,\
          AddRef,\
          Release,\
          GetDevice,\
          SetPrivateData,\
          GetPrivateData,\
          FreePrivateData,\
          SetPriority,\
          GetPriority,\
          PreLoad,\
          GetType,\
          Lock,\
          Unlock,\
          GetDesc

