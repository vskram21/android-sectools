.class public Lorg/eclipse/jgit/errors/UnpackException;
.super Ljava/io/IOException;
.source "UnpackException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .parameter "why"

    .prologue
    .line 61
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->unpackException:Ljava/lang/String;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/errors/UnpackException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 63
    return-void
.end method
