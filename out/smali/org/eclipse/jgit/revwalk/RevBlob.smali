.class public Lorg/eclipse/jgit/revwalk/RevBlob;
.super Lorg/eclipse/jgit/revwalk/RevObject;
.source "RevBlob.java"


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevObject;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 65
    return-void
.end method


# virtual methods
.method public final getType()I
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x3

    return v0
.end method

.method parseBody(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 1
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevBlob;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 85
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevBlob;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 86
    :cond_0
    return-void
.end method

.method parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 2
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p1, Lorg/eclipse/jgit/revwalk/RevWalk;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/ObjectReader;->has(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevBlob;->flags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/revwalk/RevBlob;->flags:I

    .line 79
    return-void

    .line 78
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/errors/MissingObjectException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevBlob;->getType()I

    move-result v1

    invoke-direct {v0, p0, v1}, Lorg/eclipse/jgit/errors/MissingObjectException;-><init>(Lorg/eclipse/jgit/lib/ObjectId;I)V

    throw v0
.end method
