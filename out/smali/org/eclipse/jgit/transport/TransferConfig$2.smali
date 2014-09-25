.class Lorg/eclipse/jgit/transport/TransferConfig$2;
.super Ljava/lang/Object;
.source "TransferConfig.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/RefFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/TransferConfig;->getRefFilter()Lorg/eclipse/jgit/transport/RefFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/TransferConfig;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransferConfig;)V
    .locals 0
    .parameter

    .prologue
    .line 107
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransferConfig$2;->this$0:Lorg/eclipse/jgit/transport/TransferConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private prefixMatch(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "p"
    .parameter "s"

    .prologue
    .line 125
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-ne v0, v1, :cond_0

    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public filter(Ljava/util/Map;)Ljava/util/Map;
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 110
    .local v7, result:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 111
    .local v2, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v0, 0x1

    .line 112
    .local v0, add:Z
    iget-object v8, p0, Lorg/eclipse/jgit/transport/TransferConfig$2;->this$0:Lorg/eclipse/jgit/transport/TransferConfig;

    #getter for: Lorg/eclipse/jgit/transport/TransferConfig;->hideRefs:[Ljava/lang/String;
    invoke-static {v8}, Lorg/eclipse/jgit/transport/TransferConfig;->access$100(Lorg/eclipse/jgit/transport/TransferConfig;)[Ljava/lang/String;

    move-result-object v1

    .local v1, arr$:[Ljava/lang/String;
    array-length v6, v1

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1
    if-ge v5, v6, :cond_2

    aget-object v3, v1, v5

    .line 113
    .local v3, hide:Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {p0, v3, v8}, Lorg/eclipse/jgit/transport/TransferConfig$2;->prefixMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 114
    :cond_1
    const/4 v0, 0x0

    .line 118
    .end local v3           #hide:Ljava/lang/String;
    :cond_2
    if-eqz v0, :cond_0

    .line 119
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 112
    .restart local v3       #hide:Ljava/lang/String;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 121
    .end local v0           #add:Z
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v3           #hide:Ljava/lang/String;
    .end local v5           #i$:I
    .end local v6           #len$:I
    :cond_4
    return-object v7
.end method
