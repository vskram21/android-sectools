.class Lorg/eclipse/jgit/util/RefMap$1;
.super Ljava/util/AbstractSet;
.source "RefMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/util/RefMap;->entrySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/util/RefMap;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/RefMap;)V
    .locals 0
    .parameter

    .prologue
    .line 223
    iput-object p1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 250
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    #setter for: Lorg/eclipse/jgit/util/RefMap;->packed:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RefMap;->access$202(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;

    .line 251
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    #setter for: Lorg/eclipse/jgit/util/RefMap;->loose:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RefMap;->access$302(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;

    .line 252
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v1

    #setter for: Lorg/eclipse/jgit/util/RefMap;->resolved:Lorg/eclipse/jgit/util/RefList;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RefMap;->access$402(Lorg/eclipse/jgit/util/RefMap;Lorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/util/RefList;

    .line 253
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    const/4 v1, 0x0

    #setter for: Lorg/eclipse/jgit/util/RefMap;->size:I
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RefMap;->access$102(Lorg/eclipse/jgit/util/RefMap;I)I

    .line 254
    iget-object v0, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    const/4 v1, 0x1

    #setter for: Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RefMap;->access$002(Lorg/eclipse/jgit/util/RefMap;Z)Z

    .line 255
    return-void
.end method

.method public isEmpty()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 243
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z
    invoke-static {v2}, Lorg/eclipse/jgit/util/RefMap;->access$000(Lorg/eclipse/jgit/util/RefMap;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 244
    iget-object v2, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->size:I
    invoke-static {v2}, Lorg/eclipse/jgit/util/RefMap;->access$100(Lorg/eclipse/jgit/util/RefMap;)I

    move-result v2

    if-nez v2, :cond_1

    .line 245
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 244
    goto :goto_0

    .line 245
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RefMap$1;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 226
    new-instance v0, Lorg/eclipse/jgit/util/RefMap$SetIterator;

    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/RefMap$SetIterator;-><init>(Lorg/eclipse/jgit/util/RefMap;)V

    return-object v0
.end method

.method public size()I
    .locals 3

    .prologue
    .line 231
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z
    invoke-static {v1}, Lorg/eclipse/jgit/util/RefMap;->access$000(Lorg/eclipse/jgit/util/RefMap;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 232
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    const/4 v2, 0x0

    #setter for: Lorg/eclipse/jgit/util/RefMap;->size:I
    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/RefMap;->access$102(Lorg/eclipse/jgit/util/RefMap;I)I

    .line 233
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/RefMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 234
    .local v0, i:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 235
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    invoke-static {v1}, Lorg/eclipse/jgit/util/RefMap;->access$108(Lorg/eclipse/jgit/util/RefMap;)I

    .line 234
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    .line 236
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    const/4 v2, 0x1

    #setter for: Lorg/eclipse/jgit/util/RefMap;->sizeIsValid:Z
    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/RefMap;->access$002(Lorg/eclipse/jgit/util/RefMap;Z)Z

    .line 238
    .end local v0           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/util/RefMap$1;->this$0:Lorg/eclipse/jgit/util/RefMap;

    #getter for: Lorg/eclipse/jgit/util/RefMap;->size:I
    invoke-static {v1}, Lorg/eclipse/jgit/util/RefMap;->access$100(Lorg/eclipse/jgit/util/RefMap;)I

    move-result v1

    return v1
.end method
