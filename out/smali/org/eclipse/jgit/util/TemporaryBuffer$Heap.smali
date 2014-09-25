.class public Lorg/eclipse/jgit/util/TemporaryBuffer$Heap;
.super Lorg/eclipse/jgit/util/TemporaryBuffer;
.source "TemporaryBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/TemporaryBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Heap"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .parameter "limit"

    .prologue
    .line 499
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/TemporaryBuffer;-><init>(I)V

    .line 500
    return-void
.end method


# virtual methods
.method protected overflow()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 504
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->inMemoryBufferLimitExceeded:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
