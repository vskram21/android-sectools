.class Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;
.super Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;
.source "AndTreeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Binary"
.end annotation


# instance fields
.field private final a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

.field private final b:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 0
    .parameter "one"
    .parameter "two"

    .prologue
    .line 122
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;-><init>()V

    .line 123
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 124
    iput-object p2, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->b:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 125
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
    .line 117
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 3

    .prologue
    .line 141
    new-instance v0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->b:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;-><init>(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    return-object v0
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
    .line 131
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->b:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public shouldBeRecursive()Z
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->shouldBeRecursive()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->b:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->shouldBeRecursive()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->a:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$Binary;->b:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
