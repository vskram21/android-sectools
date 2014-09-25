.class public Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "NotTreeFilter.java"


# instance fields
.field private final a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 0
    .parameter "one"

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 70
    return-void
.end method

.method public static create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 1
    .parameter "a"

    .prologue
    .line 63
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;-><init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

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
    .line 54
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 2

    .prologue
    .line 91
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    .line 92
    .local v0, n:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    if-ne v0, v1, :cond_0

    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    new-instance p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;

    .end local p0
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;-><init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    goto :goto_0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 1
    .parameter "walker"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public negate()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    return-object v0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->shouldBeRecursive()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NOT "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/NotTreeFilter;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
