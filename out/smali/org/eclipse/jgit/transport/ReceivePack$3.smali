.class Lorg/eclipse/jgit/transport/ReceivePack$3;
.super Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;
.source "ReceivePack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/ReceivePack;->service()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/ReceivePack;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/ReceivePack;)V
    .locals 0
    .parameter

    .prologue
    .line 229
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceivePack$3;->this$0:Lorg/eclipse/jgit/transport/ReceivePack;

    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BaseReceivePack$Reporter;-><init>()V

    return-void
.end method


# virtual methods
.method sendString(Ljava/lang/String;)V
    .locals 3
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceivePack$3;->this$0:Lorg/eclipse/jgit/transport/ReceivePack;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/ReceivePack;->msgOut:Ljava/io/OutputStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 232
    return-void
.end method
