.class abstract Lorg/eclipse/jgit/fnmatch/AbstractHead;
.super Ljava/lang/Object;
.source "AbstractHead.java"

# interfaces
.implements Lorg/eclipse/jgit/fnmatch/Head;


# instance fields
.field private newHeads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation
.end field

.field private final star:Z


# direct methods
.method constructor <init>(Z)V
    .locals 1
    .parameter "star"

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/fnmatch/AbstractHead;->newHeads:Ljava/util/List;

    .line 59
    iput-boolean p1, p0, Lorg/eclipse/jgit/fnmatch/AbstractHead;->star:Z

    .line 60
    return-void
.end method


# virtual methods
.method public getNextHeads(C)Ljava/util/List;
    .locals 1
    .parameter "c"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/fnmatch/AbstractHead;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lorg/eclipse/jgit/fnmatch/AbstractHead;->newHeads:Ljava/util/List;

    .line 77
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->EMPTY_HEAD_LIST:Ljava/util/List;

    goto :goto_0
.end method

.method isStar()Z
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lorg/eclipse/jgit/fnmatch/AbstractHead;->star:Z

    return v0
.end method

.method protected abstract matches(C)Z
.end method

.method public final setNewHeads(Ljava/util/List;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/fnmatch/Head;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, newHeads:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/fnmatch/Head;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/fnmatch/AbstractHead;->newHeads:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 69
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->propertyIsAlreadyNonNull:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/fnmatch/AbstractHead;->newHeads:Ljava/util/List;

    .line 71
    return-void
.end method
