.class Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;
.super Ljava/lang/Object;
.source "ObjectIdSubclassMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->iterator()Ljava/util/Iterator;
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
.field private found:I

.field private i:I

.field final synthetic this$0:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;)V
    .locals 0
    .parameter

    .prologue
    .line 190
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap.1;"
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 196
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap.1;"
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->found:I

    iget-object v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    #getter for: Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->size:I
    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->access$000(Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;)I

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
    .line 190
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap.1;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->next()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 200
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap.1;"
    :cond_0
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->i:I

    iget-object v2, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    #getter for: Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->access$100(Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;)[Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 201
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->this$0:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;

    #getter for: Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->table:[Lorg/eclipse/jgit/lib/ObjectId;
    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;->access$100(Lorg/eclipse/jgit/lib/ObjectIdSubclassMap;)[Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    iget v2, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->i:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->i:I

    aget-object v0, v1, v2

    .line 202
    .local v0, v:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    if-eqz v0, :cond_0

    .line 203
    iget v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->found:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;->found:I

    .line 204
    return-object v0

    .line 207
    .end local v0           #v:Lorg/eclipse/jgit/lib/ObjectId;,"TV;"
    :cond_1
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 211
    .local p0, this:Lorg/eclipse/jgit/lib/ObjectIdSubclassMap$1;,"Lorg/eclipse/jgit/lib/ObjectIdSubclassMap.1;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
