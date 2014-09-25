.class Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;
.super Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
.source "PathFilterGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Single"
.end annotation


# instance fields
.field private final path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

.field private final raw:[B


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V
    .locals 1
    .parameter "p"

    .prologue
    .line 153
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;-><init>()V

    .line 154
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    iget-object v0, v0, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->pathRaw:[B

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->raw:[B

    .line 156
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/treewalk/filter/PathFilter;Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;-><init>(Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    return-void
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
    .line 148
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 0

    .prologue
    .line 173
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 3
    .parameter "walker"

    .prologue
    .line 160
    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->raw:[B

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->raw:[B

    array-length v2, v2

    invoke-virtual {p1, v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isPathPrefix([BI)I

    move-result v0

    .line 161
    .local v0, cmp:I
    if-lez v0, :cond_0

    .line 162
    sget-object v1, Lorg/eclipse/jgit/errors/StopWalkException;->INSTANCE:Lorg/eclipse/jgit/errors/StopWalkException;

    throw v1

    .line 163
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->shouldBeRecursive()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FAST_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup$Single;->path:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
