.class Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;
.super Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;
.source "AndTreeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "List"
.end annotation


# instance fields
.field private final subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;


# direct methods
.method constructor <init>([Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 0
    .parameter "list"

    .prologue
    .line 154
    invoke-direct {p0}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;-><init>()V

    .line 155
    iput-object p1, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 156
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
    .line 151
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    .locals 3

    .prologue
    .line 179
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    array-length v2, v2

    new-array v1, v2, [Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 180
    .local v1, s:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 181
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->clone()Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v2

    aput-object v2, v1, v0

    .line 180
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 182
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;-><init>([Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    return-object v2
.end method

.method public include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 5
    .parameter "walker"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 163
    .local v1, f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->include(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 164
    const/4 v4, 0x0

    .line 166
    .end local v1           #f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :goto_1
    return v4

    .line 162
    .restart local v1       #f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 166
    .end local v1           #f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :cond_1
    const/4 v4, 0x1

    goto :goto_1
.end method

.method public shouldBeRecursive()Z
    .locals 5

    .prologue
    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .local v0, arr$:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 172
    .local v1, f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->shouldBeRecursive()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 173
    const/4 v4, 0x1

    .line 174
    .end local v1           #f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :goto_1
    return v4

    .line 171
    .restart local v1       #f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 174
    .end local v1           #f:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .local v1, r:Ljava/lang/StringBuilder;
    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 191
    if-lez v0, :cond_0

    .line 192
    const-string v2, " AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter$List;->subfilters:[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 195
    :cond_1
    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
