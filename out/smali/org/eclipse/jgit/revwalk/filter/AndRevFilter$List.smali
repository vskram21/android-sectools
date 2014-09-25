.class Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;
.super Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;
.source "AndRevFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "List"
.end annotation


# instance fields
.field private final requiresCommitBody:Z

.field private final subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;


# direct methods
.method constructor <init>([Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V
    .locals 6
    .parameter "list"

    .prologue
    .line 161
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;-><init>()V

    .line 162
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 164
    const/4 v4, 0x0

    .line 165
    .local v4, rcb:Z
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 166
    .local v1, filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->requiresCommitBody()Z

    move-result v5

    or-int/2addr v4, v5

    .line 165
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 167
    .end local v1           #filter:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    :cond_0
    iput-boolean v4, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->requiresCommitBody:Z

    .line 168
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
    .line 156
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 3

    .prologue
    .line 188
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    array-length v2, v2

    new-array v1, v2, [Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .line 189
    .local v1, s:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 190
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v2

    aput-object v2, v1, v0

    .line 189
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 191
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;-><init>([Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    return-object v2
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 5
    .parameter "walker"
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    .local v0, arr$:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 175
    .local v1, f:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 176
    const/4 v4, 0x0

    .line 178
    .end local v1           #f:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    :goto_1
    return v4

    .line 174
    .restart local v1       #f:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 178
    .end local v1           #f:Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    :cond_1
    const/4 v4, 0x1

    goto :goto_1
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 183
    iget-boolean v0, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->requiresCommitBody:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 197
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .local v1, r:Ljava/lang/StringBuilder;
    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 200
    if-lez v0, :cond_0

    .line 201
    const-string v2, " AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter$List;->subfilters:[Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 204
    :cond_1
    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
