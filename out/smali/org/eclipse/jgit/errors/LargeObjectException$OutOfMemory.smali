.class public Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;
.super Lorg/eclipse/jgit/errors/LargeObjectException;
.source "LargeObjectException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/errors/LargeObjectException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OutOfMemory"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/OutOfMemoryError;)V
    .locals 0
    .parameter "cause"

    .prologue
    .line 113
    invoke-direct {p0}, Lorg/eclipse/jgit/errors/LargeObjectException;-><init>()V

    .line 114
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 115
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 4

    .prologue
    .line 119
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->largeObjectOutOfMemory:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;->getObjectName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
