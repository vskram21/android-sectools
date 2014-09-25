.class Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;
.super Ljava/lang/Object;
.source "ObjectIdOwnerMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private dirIdx:I

.field private found:I

.field private next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field private tblIdx:I

.field final synthetic this$0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)V
    .locals 0
    .parameter

    .prologue
    .line 223
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap.1;"
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private found(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap.1;"
    .local p1, v:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->found:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->found:I

    .line 260
    iget-object v0, p1, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    .line 261
    return-object p1
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 233
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap.1;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->found:I

    iget-object v1, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    #getter for: Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->size:I
    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->access$000(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 223
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap.1;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->next()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 237
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap.1;"
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    if-eqz v2, :cond_0

    .line 238
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->next:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->found(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    .line 252
    :goto_0
    return-object v2

    .line 241
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    #getter for: Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->access$100(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    iget v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->dirIdx:I

    aget-object v0, v2, v3

    .line 242
    .local v0, table:[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"[TV;"
    iget v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->tblIdx:I

    array-length v3, v0

    if-ne v2, v3, :cond_2

    .line 243
    iget v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->dirIdx:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->dirIdx:I

    const/4 v3, 0x1

    iget-object v4, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    #getter for: Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->bits:I
    invoke-static {v4}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->access$200(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)I

    move-result v4

    shl-int/2addr v3, v4

    if-lt v2, v3, :cond_1

    .line 244
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2

    .line 245
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    #getter for: Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->directory:[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->access$100(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)[[Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    iget v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->dirIdx:I

    aget-object v0, v2, v3

    .line 246
    const/4 v2, 0x0

    iput v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->tblIdx:I

    .line 249
    :cond_2
    iget v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->tblIdx:I

    array-length v3, v0

    if-ge v2, v3, :cond_0

    .line 250
    iget v2, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->tblIdx:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->tblIdx:I

    aget-object v1, v0, v2

    .line 251
    .local v1, v:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;,"TV;"
    if-eqz v1, :cond_2

    .line 252
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;->found(Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 265
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap.1;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
