.class public Lorg/eclipse/jgit/errors/AmbiguousObjectException;
.super Ljava/io/IOException;
.source "AmbiguousObjectException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final candidates:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final missing:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/util/Collection;)V
    .locals 4
    .parameter "id"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p2, candidates:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->ambiguousObjectAbbreviation:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 75
    iput-object p1, p0, Lorg/eclipse/jgit/errors/AmbiguousObjectException;->missing:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 76
    iput-object p2, p0, Lorg/eclipse/jgit/errors/AmbiguousObjectException;->candidates:Ljava/util/Collection;

    .line 77
    return-void
.end method


# virtual methods
.method public getAbbreviatedObjectId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/errors/AmbiguousObjectException;->missing:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    return-object v0
.end method

.method public getCandidates()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lorg/eclipse/jgit/errors/AmbiguousObjectException;->candidates:Ljava/util/Collection;

    return-object v0
.end method
