.class public Lorg/eclipse/jgit/treewalk/filter/PathFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "PathFilter.java"


# instance fields
.field final pathRaw:[B

.field final pathStr:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 88
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathStr:Ljava/lang/String;

    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathStr:Ljava/lang/String;

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    .line 91
    return-void
.end method

.method public static create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    .locals 2
    .parameter "path"

    .prologue
    .line 77
    :goto_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->emptyPathNotPermitted:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;-><init>(Ljava/lang/String;)V

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
    .line 58
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/PathFilter;
    .locals 0

    .prologue
    .line 113
    return-object p0
.end method

.method public bridge synthetic clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 1

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathStr:Ljava/lang/String;

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 2
    .parameter "walker"

    .prologue
    .line 100
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    array-length v1, v1

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isPathPrefix([BI)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDone(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 2
    .parameter "walker"

    .prologue
    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    array-length v0, v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathLength()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 5

    .prologue
    .line 105
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    .local v0, arr$:[B
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-byte v1, v0, v2

    .line 106
    .local v1, b:B
    const/16 v4, 0x2f

    if-ne v1, v4, :cond_0

    .line 107
    const/4 v4, 0x1

    .line 108
    .end local v1           #b:B
    :goto_1
    return v4

    .line 105
    .restart local v1       #b:B
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    .end local v1           #b:B
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PATH(\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathStr:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
