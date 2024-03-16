object WebModuleApi: TWebModuleApi
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Default = True
      Name = 'WebActionPadrao'
      OnAction = WebModuleApiWebActionPadraoAction
    end
    item
      MethodType = mtPost
      Name = 'webAuthorization'
      PathInfo = '/v1/authorization'
      OnAction = WebModuleApiwebAuthorizationAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  OnException = WebModuleException
  Height = 201
  Width = 389
end
