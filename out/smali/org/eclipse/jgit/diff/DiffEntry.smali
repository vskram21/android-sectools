.class public Lorg/eclipse/jgit/diff/DiffEntry;
.super Ljava/lang/Object;
.source "DiffEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/DiffEntry$1;,
        Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;,
        Lorg/eclipse/jgit/diff/DiffEntry$Side;
    }
.end annotation


# static fields
.field static final A_ZERO:Lorg/eclipse/jgit/lib/AbbreviatedObjectId; = null

.field public static final DEV_NULL:Ljava/lang/String; = "/dev/null"


# instance fields
.field protected changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

.field protected newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

.field protected newMode:Lorg/eclipse/jgit/lib/FileMode;

.field protected newPath:Ljava/lang/String;

.field protected oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

.field protected oldMode:Lorg/eclipse/jgit/lib/FileMode;

.field protected oldPath:Ljava/lang/String;

.field protected score:I

.field private treeFilterMarks:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry;->A_ZERO:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 344
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->treeFilterMarks:I

    .line 102
    return-void
.end method

.method static add(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 2
    .parameter "path"
    .parameter "id"

    .prologue
    .line 228
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 229
    .local v0, e:Lorg/eclipse/jgit/diff/DiffEntry;
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry;->A_ZERO:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 230
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 231
    const-string v1, "/dev/null"

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 233
    invoke-static {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 234
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 235
    iput-object p0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 236
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 237
    return-object v0
.end method

.method static breakModify(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/util/List;
    .locals 4
    .parameter "entry"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 274
    new-instance v1, Lorg/eclipse/jgit/diff/DiffEntry;

    invoke-direct {v1}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 275
    .local v1, del:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v2

    iput-object v2, v1, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 276
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    iput-object v2, v1, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 277
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 279
    sget-object v2, Lorg/eclipse/jgit/diff/DiffEntry;->A_ZERO:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iput-object v2, v1, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 280
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v2, v1, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 281
    const-string v2, "/dev/null"

    iput-object v2, v1, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 282
    sget-object v2, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v2, v1, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 284
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 285
    .local v0, add:Lorg/eclipse/jgit/diff/DiffEntry;
    sget-object v2, Lorg/eclipse/jgit/diff/DiffEntry;->A_ZERO:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iput-object v2, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 286
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v2, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 287
    const-string v2, "/dev/null"

    iput-object v2, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 289
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v2

    iput-object v2, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 290
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    iput-object v2, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 291
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 292
    sget-object v2, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v2, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 293
    const/4 v2, 0x2

    new-array v2, v2, [Lorg/eclipse/jgit/diff/DiffEntry;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method static delete(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 2
    .parameter "path"
    .parameter "id"

    .prologue
    .line 241
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 242
    .local v0, e:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-static {p1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 243
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 244
    iput-object p0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 246
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry;->A_ZERO:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 247
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 248
    const-string v1, "/dev/null"

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 249
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 250
    return-object v0
.end method

.method static modify(Ljava/lang/String;)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 2
    .parameter "path"

    .prologue
    .line 254
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 255
    .local v0, e:Lorg/eclipse/jgit/diff/DiffEntry;
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 256
    iput-object p0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 258
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 259
    iput-object p0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 260
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 261
    return-object v0
.end method

.method static pair(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;I)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 3
    .parameter "changeType"
    .parameter "src"
    .parameter "dst"
    .parameter "score"

    .prologue
    .line 298
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 300
    .local v0, r:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v1, p1, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 301
    iget-object v1, p1, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 302
    iget-object v1, p1, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 304
    iget-object v1, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 305
    iget-object v1, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 306
    iget-object v1, p2, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    iput-object v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 308
    iput-object p0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 309
    iput p3, v0, Lorg/eclipse/jgit/diff/DiffEntry;->score:I

    .line 311
    iget v1, p1, Lorg/eclipse/jgit/diff/DiffEntry;->treeFilterMarks:I

    iget v2, p2, Lorg/eclipse/jgit/diff/DiffEntry;->treeFilterMarks:I

    or-int/2addr v1, v2

    iput v1, v0, Lorg/eclipse/jgit/diff/DiffEntry;->treeFilterMarks:I

    .line 313
    return-object v0
.end method

.method public static scan(Lorg/eclipse/jgit/treewalk/TreeWalk;)Ljava/util/List;
    .locals 1
    .parameter "walk"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/treewalk/TreeWalk;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/diff/DiffEntry;->scan(Lorg/eclipse/jgit/treewalk/TreeWalk;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static scan(Lorg/eclipse/jgit/treewalk/TreeWalk;Z)Ljava/util/List;
    .locals 1
    .parameter "walk"
    .parameter "includeTrees"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/treewalk/TreeWalk;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/diff/DiffEntry;->scan(Lorg/eclipse/jgit/treewalk/TreeWalk;Z[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static scan(Lorg/eclipse/jgit/treewalk/TreeWalk;Z[Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Ljava/util/List;
    .locals 8
    .parameter "walk"
    .parameter "includeTrees"
    .parameter "markTreeFilters"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/treewalk/TreeWalk;",
            "Z[",
            "Lorg/eclipse/jgit/treewalk/filter/TreeFilter;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 169
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTreeCount()I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_0

    .line 170
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->treeWalkMustHaveExactlyTwoTrees:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 172
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isRecursive()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 173
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->cannotBeRecursiveWhenTreesAreIncluded:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 177
    :cond_1
    if-eqz p2, :cond_5

    array-length v4, p2

    if-lez v4, :cond_5

    .line 178
    new-instance v3, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;

    invoke-direct {v3, p2}, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;-><init>([Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 182
    .local v3, treeFilterMarker:Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .local v2, r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    new-instance v1, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    .line 184
    .local v1, idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 185
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 187
    .local v0, entry:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-virtual {p0, v1, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 188
    invoke-static {v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v4

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 190
    invoke-virtual {p0, v1, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 191
    invoke-static {v1}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v4

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 193
    invoke-virtual {p0, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 194
    invoke-virtual {p0, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 195
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 197
    if-eqz v3, :cond_3

    .line 198
    invoke-virtual {v3, p0}, Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;->getMarks(Lorg/eclipse/jgit/treewalk/TreeWalk;)I

    move-result v4

    iput v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->treeFilterMarks:I

    .line 200
    :cond_3
    iget-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    sget-object v5, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v4, v5, :cond_6

    .line 201
    const-string v4, "/dev/null"

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 202
    sget-object v4, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 203
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    :cond_4
    :goto_2
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isSubtree()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 222
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->enterSubtree()V

    goto :goto_1

    .line 180
    .end local v0           #entry:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v1           #idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;
    .end local v2           #r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    .end local v3           #treeFilterMarker:Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;
    :cond_5
    const/4 v3, 0x0

    .restart local v3       #treeFilterMarker:Lorg/eclipse/jgit/treewalk/filter/TreeFilterMarker;
    goto :goto_0

    .line 205
    .restart local v0       #entry:Lorg/eclipse/jgit/diff/DiffEntry;
    .restart local v1       #idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;
    .restart local v2       #r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :cond_6
    iget-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    sget-object v5, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    if-ne v4, v5, :cond_7

    .line 206
    const-string v4, "/dev/null"

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 207
    sget-object v4, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 208
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 210
    :cond_7
    iget-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iget-object v5, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 211
    sget-object v4, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 212
    iget-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v5, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    invoke-static {v4, v5}, Lorg/eclipse/jgit/diff/RenameDetector;->sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 213
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 215
    :cond_8
    invoke-static {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->breakModify(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 216
    :cond_9
    iget-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v5, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    if-eq v4, v5, :cond_4

    .line 217
    sget-object v4, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 218
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 224
    .end local v0           #entry:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_a
    return-object v2
.end method


# virtual methods
.method public getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    return-object v0
.end method

.method public getId(Lorg/eclipse/jgit/diff/DiffEntry$Side;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1
    .parameter "side"

    .prologue
    .line 498
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    goto :goto_0
.end method

.method public getMode(Lorg/eclipse/jgit/diff/DiffEntry$Side;)Lorg/eclipse/jgit/lib/FileMode;
    .locals 1
    .parameter "side"

    .prologue
    .line 413
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    goto :goto_0
.end method

.method public getNewId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1

    .prologue
    .line 445
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    return-object v0
.end method

.method public getNewMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    return-object v0
.end method

.method public getNewPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    return-object v0
.end method

.method public getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1

    .prologue
    .line 436
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    return-object v0
.end method

.method public getOldMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 397
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    return-object v0
.end method

.method public getOldPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 362
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPath(Lorg/eclipse/jgit/diff/DiffEntry$Side;)Ljava/lang/String;
    .locals 1
    .parameter "side"

    .prologue
    .line 392
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getScore()I
    .locals 1

    .prologue
    .line 427
    iget v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->score:I

    return v0
.end method

.method public getTreeFilterMarks()I
    .locals 1

    .prologue
    .line 487
    iget v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->treeFilterMarks:I

    return v0
.end method

.method public isMarked(I)Z
    .locals 4
    .parameter "index"

    .prologue
    .line 475
    iget v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->treeFilterMarks:I

    int-to-long v0, v0

    const-wide/16 v2, 0x1

    shl-long/2addr v2, p1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 504
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 505
    .local v0, buf:Ljava/lang/StringBuilder;
    const-string v1, "DiffEntry["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 507
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 525
    :goto_0
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 510
    :pswitch_0
    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 513
    :pswitch_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 516
    :pswitch_2
    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 519
    :pswitch_3
    iget-object v1, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 522
    :pswitch_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 508
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
