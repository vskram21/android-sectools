.class Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;
.super Ljava/io/InputStream;
.source "TransportHttp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/TransportHttp$Service;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HttpExecuteStream"
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportHttp$Service;)V
    .locals 0
    .parameter

    .prologue
    .line 897
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 899
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service;->execute()V

    .line 900
    const/4 v0, -0x1

    return v0
.end method

.method public read([BII)I
    .locals 1
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 904
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service;->execute()V

    .line 905
    const/4 v0, -0x1

    return v0
.end method

.method public skip(J)J
    .locals 2
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 909
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportHttp$Service$HttpExecuteStream;->this$1:Lorg/eclipse/jgit/transport/TransportHttp$Service;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/TransportHttp$Service;->execute()V

    .line 910
    const-wide/16 v0, 0x0

    return-wide v0
.end method
