.class public Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "PathSuffixFilter.java"


# instance fields
.field final pathRaw:[B

.field final pathStr:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 87
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 88
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;->pathStr:Ljava/lang/String;

    .line 89
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;->pathStr:Ljava/lang/String;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;->pathRaw:[B

    .line 90
    return-void
.end method

.method public static create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;
    .locals 2
    .parameter "path"

    .prologue
    .line 79
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->emptyPathNotPermitted:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 94
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 2
    .parameter "walker"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isSubtree()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    const/4 v0, 0x1

    .line 103
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;->pathRaw:[B

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/PathSuffixFilter;->pathRaw:[B

    array-length v1, v1

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isPathSuffix([BI)Z

    move-result v0

    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 109
    const/4 v0, 0x1

    return v0
.end method
