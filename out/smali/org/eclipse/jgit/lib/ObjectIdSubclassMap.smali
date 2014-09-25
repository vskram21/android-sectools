.class public Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;
.super Ljava/lang/Object;
.source "ObjectIdSubclassMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Lorg/eclipse/jgit/lib/ObjectId;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TV;>;"
    }
.end annotation


# static fields
.field private static final INITIAL_TABLE_SIZE:I = 0x800


# instance fields
.field private grow:I

.field private mask:I

.field private size:I

.field private table:[Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 75
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/16 v0, 0x800

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->initTable(I)V

    .line 77
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    return v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;)[Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "x0"

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method private final createArray(I)[Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "sz"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[TV;"
        }
    .end annotation

    .prologue
    .line 245
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    new-array v0, p1, [Lorg/eclipse/jgit/lib/ObjectId;

    check-cast v0, [Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method private grow()V
    .locals 5

    .prologue
    .line 226
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 227
    .local v3, oldTable:[Lorg/eclipse/jgit/lib/ObjectId;,"[TV;"
    iget-object v4, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;

    array-length v2, v4

    .line 229
    .local v2, oldSize:I
    shl-int/lit8 v4, v2, 0x1

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->initTable(I)V

    .line 230
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 231
    aget-object v1, v3, v0

    .line 232
    .local v1, obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    if-eqz v1, :cond_0

    .line 233
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->insert(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 230
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 235
    .end local v1           #obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    :cond_1
    return-void
.end method

.method private initTable(I)V
    .locals 1
    .parameter "sz"

    .prologue
    .line 238
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    shr-int/lit8 v0, p1, 0x1

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->grow:I

    .line 239
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->mask:I

    .line 240
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->createArray(I)[Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 241
    return-void
.end method

.method private insert(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    .local p1, newValue:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->mask:I

    .line 218
    .local v1, msk:I
    iget v3, p1, Lorg/eclipse/jgit/lib/ObjectId;->w1:I

    and-int v0, v3, v1

    .line 219
    .local v0, j:I
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 220
    .local v2, tbl:[Lorg/eclipse/jgit/lib/ObjectId;,"[TV;"
    :goto_0
    aget-object v3, v2, v0

    if-eqz v3, :cond_0

    .line 221
    add-int/lit8 v3, v0, 0x1

    and-int v0, v3, v1

    goto :goto_0

    .line 222
    :cond_0
    aput-object p1, v2, v0

    .line 223
    return-void
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Q:TV;>(TQ;)V"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    .local p1, newValue:Lorg/eclipse/jgit/lib/ObjectId;,"TQ;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->grow:I

    if-ne v0, v1, :cond_0

    .line 132
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->grow()V

    .line 133
    :cond_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->insert(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 134
    return-void
.end method

.method public addIfAbsent(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Q:TV;>(TQ;)TV;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    .local p1, newValue:Lorg/eclipse/jgit/lib/ObjectId;,"TQ;"
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->mask:I

    .line 158
    .local v1, msk:I
    iget v4, p1, Lorg/eclipse/jgit/lib/ObjectId;->w1:I

    and-int v0, v4, v1

    .line 159
    .local v0, i:I
    iget-object v3, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 162
    .local v3, tbl:[Lorg/eclipse/jgit/lib/ObjectId;,"[TV;"
    :goto_0
    aget-object v2, v3, v0

    .local v2, obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    if-eqz v2, :cond_1

    .line 163
    invoke-static {v2, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 174
    .end local v2           #obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    :goto_1
    return-object v2

    .line 165
    .restart local v2       #obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    :cond_0
    add-int/lit8 v4, v0, 0x1

    and-int v0, v4, v1

    goto :goto_0

    .line 168
    :cond_1
    iget v4, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    iget v5, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->grow:I

    if-ne v4, v5, :cond_2

    .line 169
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->grow()V

    .line 170
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->insert(Lorg/eclipse/jgit/lib/ObjectId;)V

    :goto_2
    move-object v2, p1

    .line 174
    goto :goto_1

    .line 172
    :cond_2
    aput-object p1, v3, v0

    goto :goto_2
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 81
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    .line 82
    const/16 v0, 0x800

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->initTable(I)V

    .line 83
    return-void
.end method

.method public contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "toFind"

    .prologue
    .line 114
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 5
    .parameter "toFind"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->mask:I

    .line 94
    .local v1, msk:I
    iget v4, p1, Lorg/eclipse/jgit/lib/AnyObjectId;->w1:I

    and-int v0, v4, v1

    .line 95
    .local v0, i:I
    iget-object v3, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 98
    .local v3, tbl:[Lorg/eclipse/jgit/lib/ObjectId;,"[TV;"
    :goto_0
    aget-object v2, v3, v0

    .local v2, obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    if-eqz v2, :cond_1

    .line 99
    invoke-static {v2, p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 103
    .end local v2           #obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    :goto_1
    return-object v2

    .line 101
    .restart local v2       #obj:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    :cond_0
    add-int/lit8 v4, v0, 0x1

    and-int v0, v4, v1

    goto :goto_0

    .line 103
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 186
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;-><init>(Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 181
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap<TV;>;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I

    return v0
.end method
