.class Lorg/eclipse/jgit/transport/HttpAuthMethod$Basic;
.super Lorg/eclipse/jgit/transport/HttpAuthMethod;
.source "HttpAuthMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/HttpAuthMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Basic"
.end annotation


# instance fields
.field private pass:Ljava/lang/String;

.field private user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 287
    sget-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->BASIC:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/HttpAuthMethod;-><init>(Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;)V

    .line 288
    return-void
.end method


# virtual methods
.method authorize(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "username"
    .parameter "password"

    .prologue
    .line 292
    iput-object p1, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Basic;->user:Ljava/lang/String;

    .line 293
    iput-object p2, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Basic;->pass:Ljava/lang/String;

    .line 294
    return-void
.end method

.method configureRequest(Lorg/eclipse/jgit/transport/http/HttpConnection;)V
    .locals 5
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Basic;->user:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Basic;->pass:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 299
    .local v1, ident:Ljava/lang/String;
    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/util/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v0

    .line 300
    .local v0, enc:Ljava/lang/String;
    const-string v2, "Authorization"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Basic;->type:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Lorg/eclipse/jgit/transport/http/HttpConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    return-void
.end method
