.class Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;
.super Lorg/eclipse/jgit/transport/HttpAuthMethod;
.source "HttpAuthMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/HttpAuthMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Negotiate"
.end annotation


# static fields
.field private static final GSS_MANAGER_FACTORY:Lorg/eclipse/jgit/util/GSSManagerFactory;

.field private static final OID:Lorg/ietf/jgss/Oid;


# instance fields
.field private final prevToken:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 502
    invoke-static {}, Lorg/eclipse/jgit/util/GSSManagerFactory;->detect()Lorg/eclipse/jgit/util/GSSManagerFactory;

    move-result-object v1

    sput-object v1, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->GSS_MANAGER_FACTORY:Lorg/eclipse/jgit/util/GSSManagerFactory;

    .line 509
    :try_start_0
    new-instance v1, Lorg/ietf/jgss/Oid;

    const-string v2, "1.3.6.1.5.5.2"

    invoke-direct {v1, v2}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    sput-object v1, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->OID:Lorg/ietf/jgss/Oid;
    :try_end_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0

    .line 513
    return-void

    .line 510
    :catch_0
    move-exception v0

    .line 511
    .local v0, e:Lorg/ietf/jgss/GSSException;
    new-instance v1, Ljava/lang/Error;

    const-string v2, "Cannot create NEGOTIATE oid."

    invoke-direct {v1, v2, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "hdr"

    .prologue
    .line 518
    sget-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NEGOTIATE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/HttpAuthMethod;-><init>(Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;)V

    .line 519
    invoke-static {p1}, Lorg/eclipse/jgit/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->prevToken:[B

    .line 520
    return-void
.end method


# virtual methods
.method authorize(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "user"
    .parameter "pass"

    .prologue
    .line 525
    return-void
.end method

.method configureRequest(Lorg/eclipse/jgit/transport/http/HttpConnection;)V
    .locals 11
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 529
    sget-object v8, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->GSS_MANAGER_FACTORY:Lorg/eclipse/jgit/util/GSSManagerFactory;

    invoke-interface {p1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getURL()Ljava/net/URL;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/util/GSSManagerFactory;->newInstance(Ljava/net/URL;)Lorg/ietf/jgss/GSSManager;

    move-result-object v2

    .line 531
    .local v2, gssManager:Lorg/ietf/jgss/GSSManager;
    invoke-interface {p1}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getURL()Ljava/net/URL;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v4

    .line 532
    .local v4, host:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "HTTP@"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 534
    .local v6, peerName:Ljava/lang/String;
    :try_start_0
    sget-object v8, Lorg/ietf/jgss/GSSName;->NT_HOSTBASED_SERVICE:Lorg/ietf/jgss/Oid;

    invoke-virtual {v2, v6, v8}, Lorg/ietf/jgss/GSSManager;->createName(Ljava/lang/String;Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v3

    .line 536
    .local v3, gssName:Lorg/ietf/jgss/GSSName;
    sget-object v8, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->OID:Lorg/ietf/jgss/Oid;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v2, v3, v8, v9, v10}, Lorg/ietf/jgss/GSSManager;->createContext(Lorg/ietf/jgss/GSSName;Lorg/ietf/jgss/Oid;Lorg/ietf/jgss/GSSCredential;I)Lorg/ietf/jgss/GSSContext;

    move-result-object v0

    .line 539
    .local v0, context:Lorg/ietf/jgss/GSSContext;
    const/4 v8, 0x1

    invoke-interface {v0, v8}, Lorg/ietf/jgss/GSSContext;->requestCredDeleg(Z)V

    .line 541
    iget-object v8, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->prevToken:[B

    const/4 v9, 0x0

    iget-object v10, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->prevToken:[B

    array-length v10, v10

    invoke-interface {v0, v8, v9, v10}, Lorg/ietf/jgss/GSSContext;->initSecContext([BII)[B

    move-result-object v7

    .line 544
    .local v7, token:[B
    const-string v8, "Authorization"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;->getType()Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    move-result-object v10

    invoke-virtual {v10}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->getSchemeName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v7}, Lorg/eclipse/jgit/util/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {p1, v8, v9}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0

    .line 551
    return-void

    .line 546
    .end local v0           #context:Lorg/ietf/jgss/GSSContext;
    .end local v3           #gssName:Lorg/ietf/jgss/GSSName;
    .end local v7           #token:[B
    :catch_0
    move-exception v1

    .line 547
    .local v1, e:Lorg/ietf/jgss/GSSException;
    new-instance v5, Ljava/io/IOException;

    invoke-direct {v5}, Ljava/io/IOException;-><init>()V

    .line 548
    .local v5, ioe:Ljava/io/IOException;
    invoke-virtual {v5, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 549
    throw v5
.end method
