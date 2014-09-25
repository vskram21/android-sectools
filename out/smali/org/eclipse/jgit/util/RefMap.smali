.class public Lorg/eclipse/jgit/util/RefMap;
.super Ljava/util/AbstractMap;
.source "RefMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/RefMap$Ent;,
        Lorg/eclipse/jgit/util/RefMap$SetIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap",
        "<",
        "Ljava/lang/String;",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field private entrySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;>;"
        }
    .end annotation
.end field

.field private loose:Lorg/eclipse/jgit/util/RefList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private packed:Lorg/eclipse/jgit/util/RefList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private final prefix:Ljava/lang/String;

.field private resolved:Lorg/eclipse/jgit/util/RefList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private size:I

.field private sizeIsValid:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 114
    const-string v0, ""

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;

    .line 115
    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    .line 116
    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    .line 117
    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    .line 118
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V
    .locals 0
    .parameter "prefix"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/util/RefList",
            "<+",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Lorg/eclipse/jgit/util/RefList",
            "<+",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;",
            "Lorg/eclipse/jgit/util/RefList",
            "<+",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p2, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<+Lorg/eclipse/jgit/lib/Ref;>;"
    .local p3, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<+Lorg/eclipse/jgit/lib/Ref;>;"
    .local p4, resolved:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<+Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 142
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;

    .line 143
    iput-object p2, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    .line 144
    iput-object p3, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    .line 145
    iput-object p4, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    .line 146
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/util/RefMap;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-boolean v0, p0, Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z

    return v0
.end method

.method static synthetic access$002(Lorg/eclipse/jgit/util/RefMap;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    iput-boolean p1, p0, Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z

    return p1
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/util/RefMap;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget v0, p0, Lorg/eclipse/jgit/util/RefMap;->size:I

    return v0
.end method

.method static synthetic access$102(Lorg/eclipse/jgit/util/RefMap;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    iput p1, p0, Lorg/eclipse/jgit/util/RefMap;->size:I

    return p1
.end method

.method static synthetic access$108(Lorg/eclipse/jgit/util/RefMap;)I
    .locals 2
    .parameter "x0"

    .prologue
    .line 74
    iget v0, p0, Lorg/eclipse/jgit/util/RefMap;->size:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/eclipse/jgit/util/RefMap;->size:I

    return v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    return-object v0
.end method

.method static synthetic access$202(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    return-object p1
.end method

.method static synthetic access$300(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    return-object v0
.end method

.method static synthetic access$302(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    return-object p1
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/util/RefMap;)Lorg/eclipse/jgit/util/RefList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    return-object v0
.end method

.method static synthetic access$402(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    return-object p1
.end method

.method static synthetic access$500(Lorg/eclipse/jgit/util/RefMap;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->toMapKey(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private toMapKey(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    .locals 2
    .parameter "ref"

    .prologue
    .line 284
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    .line 285
    .local v0, name:Ljava/lang/String;
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 286
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 287
    :cond_0
    return-object v0
.end method

.method private toRefName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "name"

    .prologue
    .line 278
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 279
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 280
    :cond_0
    return-object p1
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .parameter "name"

    .prologue
    .line 150
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->get(Ljava/lang/Object;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->entrySet:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 223
    new-instance v0, Lorg/eclipse/jgit/util/RefMap$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/RefMap$1;-><init>(Lorg/eclipse/jgit/util/RefMap;)V

    iput-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->entrySet:Ljava/util/Set;

    .line 258
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap;->entrySet:Ljava/util/Set;

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->get(Ljava/lang/Object;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Lorg/eclipse/jgit/lib/Ref;
    .locals 3
    .parameter "key"

    .prologue
    .line 155
    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->toRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 156
    .local v0, name:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 157
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    if-nez v1, :cond_0

    .line 158
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 159
    :cond_0
    if-nez v1, :cond_1

    .line 160
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 161
    :cond_1
    return-object v1
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 217
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 74
    check-cast p1, Ljava/lang/String;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/lib/Ref;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/util/RefMap;->put(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 7
    .parameter "keyName"
    .parameter "value"

    .prologue
    .line 166
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->toRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 168
    .local v2, name:Ljava/lang/String;
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 169
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v6

    .line 171
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/RefList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 174
    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/RefList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/lib/Ref;

    .line 175
    .local v5, ref:Lorg/eclipse/jgit/lib/Ref;
    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v6, v5}, Lorg/eclipse/jgit/util/RefList;->put(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    goto :goto_0

    .line 176
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    .line 179
    .end local v0           #i$:Ljava/util/Iterator;
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v1

    .line 180
    .local v1, idx:I
    if-ltz v1, :cond_3

    .line 181
    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 182
    .local v3, prior:Lorg/eclipse/jgit/lib/Ref;
    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v6, v1, p2}, Lorg/eclipse/jgit/util/RefList;->set(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    move-object v4, v3

    .line 188
    .end local v3           #prior:Lorg/eclipse/jgit/lib/Ref;
    .local v4, prior:Lorg/eclipse/jgit/lib/Ref;
    :goto_1
    return-object v4

    .line 185
    .end local v4           #prior:Lorg/eclipse/jgit/lib/Ref;
    :cond_3
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->get(Ljava/lang/Object;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 186
    .restart local v3       #prior:Lorg/eclipse/jgit/lib/Ref;
    iget-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v6, v1, p2}, Lorg/eclipse/jgit/util/RefList;->add(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    iput-object v6, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    .line 187
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z

    move-object v4, v3

    .line 188
    .end local v3           #prior:Lorg/eclipse/jgit/lib/Ref;
    .restart local v4       #prior:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_1
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->remove(Ljava/lang/Object;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Lorg/eclipse/jgit/lib/Ref;
    .locals 5
    .parameter "key"

    .prologue
    const/4 v4, 0x0

    .line 194
    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/RefMap;->toRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 195
    .local v1, name:Ljava/lang/String;
    const/4 v2, 0x0

    .line 197
    .local v2, res:Lorg/eclipse/jgit/lib/Ref;
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    .local v0, idx:I
    if-ltz v0, :cond_0

    .line 198
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 199
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;

    .line 200
    iput-boolean v4, p0, Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z

    .line 202
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_1

    .line 203
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 204
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;

    .line 205
    iput-boolean v4, p0, Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z

    .line 207
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_2

    .line 208
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 209
    iget-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;

    .line 210
    iput-boolean v4, p0, Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z

    .line 212
    :cond_2
    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 263
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .local v2, r:Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 265
    .local v0, first:Z
    const/16 v4, 0x5b

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 266
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 267
    .local v3, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    .line 268
    const/4 v0, 0x0

    .line 271
    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 270
    :cond_0
    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 273
    .end local v3           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    const/16 v4, 0x5d

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 274
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
