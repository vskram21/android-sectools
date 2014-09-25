.class public Lcom/jcraft/jsch/jgss/GSSContextKrb5;
.super Ljava/lang/Object;
.source "GSSContextKrb5.java"

# interfaces
.implements Lcom/jcraft/jsch/GSSContext;


# static fields
.field private static final pUseSubjectCredsOnly:Ljava/lang/String; = "javax.security.auth.useSubjectCredsOnly"

.field private static useSubjectCredsOnly:Ljava/lang/String;


# instance fields
.field private context:Lorg/ietf/jgss/GSSContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-string v0, "javax.security.auth.useSubjectCredsOnly"

    invoke-static {v0}, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->useSubjectCredsOnly:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    return-void
.end method

.method private static getSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"

    .prologue
    .line 164
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 167
    :goto_0
    return-object v1

    .line 165
    :catch_0
    move-exception v0

    .line 167
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static setSystemProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 172
    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    :goto_0
    return-void

    .line 173
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public create(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "user"
    .parameter "host"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 55
    :try_start_0
    new-instance v4, Lorg/ietf/jgss/Oid;

    const-string v7, "1.2.840.113554.1.2.2"

    invoke-direct {v4, v7}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    .line 57
    .local v4, krb5:Lorg/ietf/jgss/Oid;
    new-instance v6, Lorg/ietf/jgss/Oid;

    const-string v7, "1.2.840.113554.1.2.2.1"

    invoke-direct {v6, v7}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    .line 59
    .local v6, principalName:Lorg/ietf/jgss/Oid;
    invoke-static {}, Lorg/ietf/jgss/GSSManager;->getInstance()Lorg/ietf/jgss/GSSManager;
    :try_end_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 61
    .local v5, mgr:Lorg/ietf/jgss/GSSManager;
    const/4 v2, 0x0

    .line 74
    .local v2, crd:Lorg/ietf/jgss/GSSCredential;
    move-object v1, p2

    .line 76
    .local v1, cname:Ljava/lang/String;
    :try_start_1
    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/ietf/jgss/GSSException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 80
    :goto_0
    :try_start_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "host/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7, v6}, Lorg/ietf/jgss/GSSManager;->createName(Ljava/lang/String;Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v0

    .line 82
    .local v0, _host:Lorg/ietf/jgss/GSSName;
    const/4 v7, 0x0

    invoke-virtual {v5, v0, v4, v2, v7}, Lorg/ietf/jgss/GSSManager;->createContext(Lorg/ietf/jgss/GSSName;Lorg/ietf/jgss/Oid;Lorg/ietf/jgss/GSSCredential;I)Lorg/ietf/jgss/GSSContext;

    move-result-object v7

    iput-object v7, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    .line 101
    iget-object v7, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    const/4 v8, 0x1

    invoke-interface {v7, v8}, Lorg/ietf/jgss/GSSContext;->requestMutualAuth(Z)V

    .line 102
    iget-object v7, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    const/4 v8, 0x1

    invoke-interface {v7, v8}, Lorg/ietf/jgss/GSSContext;->requestConf(Z)V

    .line 103
    iget-object v7, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    const/4 v8, 0x1

    invoke-interface {v7, v8}, Lorg/ietf/jgss/GSSContext;->requestInteg(Z)V

    .line 104
    iget-object v7, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    const/4 v8, 0x1

    invoke-interface {v7, v8}, Lorg/ietf/jgss/GSSContext;->requestCredDeleg(Z)V

    .line 105
    iget-object v7, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/ietf/jgss/GSSContext;->requestAnonymity(Z)V
    :try_end_2
    .catch Lorg/ietf/jgss/GSSException; {:try_start_2 .. :try_end_2} :catch_0

    .line 107
    return-void

    .line 109
    .end local v0           #_host:Lorg/ietf/jgss/GSSName;
    .end local v1           #cname:Ljava/lang/String;
    .end local v2           #crd:Lorg/ietf/jgss/GSSCredential;
    .end local v4           #krb5:Lorg/ietf/jgss/Oid;
    .end local v5           #mgr:Lorg/ietf/jgss/GSSManager;
    .end local v6           #principalName:Lorg/ietf/jgss/Oid;
    :catch_0
    move-exception v3

    .line 110
    .local v3, ex:Lorg/ietf/jgss/GSSException;
    new-instance v7, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v3}, Lorg/ietf/jgss/GSSException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 78
    .end local v3           #ex:Lorg/ietf/jgss/GSSException;
    .restart local v1       #cname:Ljava/lang/String;
    .restart local v2       #crd:Lorg/ietf/jgss/GSSCredential;
    .restart local v4       #krb5:Lorg/ietf/jgss/Oid;
    .restart local v5       #mgr:Lorg/ietf/jgss/GSSManager;
    .restart local v6       #principalName:Lorg/ietf/jgss/Oid;
    :catch_1
    move-exception v7

    goto :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 157
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    invoke-interface {v0}, Lorg/ietf/jgss/GSSContext;->dispose()V
    :try_end_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :goto_0
    return-void

    .line 159
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getMIC([BII)[B
    .locals 4
    .parameter "message"
    .parameter "s"
    .parameter "l"

    .prologue
    .line 147
    :try_start_0
    new-instance v1, Lorg/ietf/jgss/MessageProp;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lorg/ietf/jgss/MessageProp;-><init>(IZ)V

    .line 148
    .local v1, prop:Lorg/ietf/jgss/MessageProp;
    iget-object v2, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    invoke-interface {v2, p1, p2, p3, v1}, Lorg/ietf/jgss/GSSContext;->getMIC([BIILorg/ietf/jgss/MessageProp;)[B
    :try_end_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 151
    .end local v1           #prop:Lorg/ietf/jgss/MessageProp;
    :goto_0
    return-object v2

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, ex:Lorg/ietf/jgss/GSSException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public init([BII)[B
    .locals 4
    .parameter "token"
    .parameter "s"
    .parameter "l"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 126
    :try_start_0
    sget-object v1, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->useSubjectCredsOnly:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 127
    const-string v1, "javax.security.auth.useSubjectCredsOnly"

    const-string v2, "false"

    invoke-static {v1, v2}, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->setSystemProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :cond_0
    iget-object v1, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2, p3}, Lorg/ietf/jgss/GSSContext;->initSecContext([BII)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 138
    sget-object v2, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->useSubjectCredsOnly:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 140
    const-string v2, "javax.security.auth.useSubjectCredsOnly"

    const-string v3, "true"

    invoke-static {v2, v3}, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->setSystemProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v1

    .line 131
    :catch_0
    move-exception v0

    .line 132
    .local v0, ex:Lorg/ietf/jgss/GSSException;
    :try_start_1
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Lorg/ietf/jgss/GSSException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    .end local v0           #ex:Lorg/ietf/jgss/GSSException;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->useSubjectCredsOnly:Ljava/lang/String;

    if-nez v2, :cond_2

    .line 140
    const-string v2, "javax.security.auth.useSubjectCredsOnly"

    const-string v3, "true"

    invoke-static {v2, v3}, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->setSystemProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    throw v1

    .line 134
    :catch_1
    move-exception v0

    .line 135
    .local v0, ex:Ljava/lang/SecurityException;
    :try_start_2
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/SecurityException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public isEstablished()Z
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/jcraft/jsch/jgss/GSSContextKrb5;->context:Lorg/ietf/jgss/GSSContext;

    invoke-interface {v0}, Lorg/ietf/jgss/GSSContext;->isEstablished()Z

    move-result v0

    return v0
.end method
