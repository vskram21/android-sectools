.class public Lorg/eclipse/jgit/errors/CorruptObjectException;
.super Ljava/io/IOException;
.source "CorruptObjectException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "why"

    .prologue
    .line 91
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "why"
    .parameter "cause"

    .prologue
    .line 105
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/errors/CorruptObjectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 107
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;)V
    .locals 1
    .parameter "id"
    .parameter "why"

    .prologue
    .line 70
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/eclipse/jgit/errors/CorruptObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V
    .locals 4
    .parameter "id"
    .parameter "why"

    .prologue
    .line 81
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->objectIsCorrupt:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 82
    return-void
.end method
