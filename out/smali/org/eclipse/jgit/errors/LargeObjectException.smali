.class public Lorg/eclipse/jgit/errors/LargeObjectException;
.super Ljava/lang/RuntimeException;
.source "LargeObjectException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsByteArrayLimit;,
        Lorg/eclipse/jgit/errors/LargeObjectException$ExceedsLimit;,
        Lorg/eclipse/jgit/errors/LargeObjectException$OutOfMemory;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private objectId:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 71
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/errors/LargeObjectException;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 72
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 4

    .prologue
    .line 99
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->largeObjectException:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/errors/LargeObjectException;->getObjectName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/eclipse/jgit/errors/LargeObjectException;->objectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method protected getObjectName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/eclipse/jgit/errors/LargeObjectException;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lorg/eclipse/jgit/errors/LargeObjectException;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v0

    .line 83
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->unknownObject:Ljava/lang/String;

    goto :goto_0
.end method

.method public setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 93
    iget-object v0, p0, Lorg/eclipse/jgit/errors/LargeObjectException;->objectId:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v0, :cond_0

    .line 94
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/errors/LargeObjectException;->objectId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 95
    :cond_0
    return-void
.end method
