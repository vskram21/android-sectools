.class public Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
.super Ljava/io/IOException;
.source "ServiceMayNotContinueException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private output:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 71
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "msg"
    .parameter "cause"

    .prologue
    .line 83
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 84
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .parameter "cause"

    .prologue
    .line 95
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->internalServerError:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    return-void
.end method


# virtual methods
.method public isOutput()Z
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->output:Z

    return v0
.end method

.method public setOutput()V
    .locals 1

    .prologue
    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;->output:Z

    .line 106
    return-void
.end method
