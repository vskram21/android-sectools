.class Lorg/eclipse/jgit/notes/FanoutBucket$1;
.super Ljava/lang/Object;
.source "FanoutBucket.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/notes/FanoutBucket;->iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/eclipse/jgit/notes/Note;",
        ">;"
    }
.end annotation


# instance fields
.field private cell:I

.field private itr:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/notes/Note;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

.field final synthetic val$id:Lorg/eclipse/jgit/lib/MutableObjectId;

.field final synthetic val$reader:Lorg/eclipse/jgit/lib/ObjectReader;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/notes/FanoutBucket;Lorg/eclipse/jgit/lib/MutableObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 138
    iput-object p1, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    iput-object p2, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->val$id:Lorg/eclipse/jgit/lib/MutableObjectId;

    iput-object p3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->val$reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 144
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->itr:Ljava/util/Iterator;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->itr:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 164
    :goto_0
    return v2

    .line 147
    :cond_0
    :goto_1
    iget v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->cell:I

    iget-object v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    #getter for: Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;
    invoke-static {v4}, Lorg/eclipse/jgit/notes/FanoutBucket;->access$100(Lorg/eclipse/jgit/notes/FanoutBucket;)[Lorg/eclipse/jgit/notes/NoteBucket;

    move-result-object v4

    array-length v4, v4

    if-ge v3, v4, :cond_3

    .line 148
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    #getter for: Lorg/eclipse/jgit/notes/FanoutBucket;->table:[Lorg/eclipse/jgit/notes/NoteBucket;
    invoke-static {v3}, Lorg/eclipse/jgit/notes/FanoutBucket;->access$100(Lorg/eclipse/jgit/notes/FanoutBucket;)[Lorg/eclipse/jgit/notes/NoteBucket;

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->cell:I

    aget-object v0, v3, v4

    .line 149
    .local v0, b:Lorg/eclipse/jgit/notes/NoteBucket;
    if-nez v0, :cond_2

    .line 147
    :cond_1
    iget v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->cell:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->cell:I

    goto :goto_1

    .line 153
    :cond_2
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->val$id:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->this$0:Lorg/eclipse/jgit/notes/FanoutBucket;

    iget v4, v4, Lorg/eclipse/jgit/notes/FanoutBucket;->prefixLen:I

    shr-int/lit8 v4, v4, 0x1

    iget v5, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->cell:I

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/lib/MutableObjectId;->setByte(II)V

    .line 154
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->val$id:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v4, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->val$reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jgit/notes/NoteBucket;->iterator(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectReader;)Ljava/util/Iterator;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->itr:Ljava/util/Iterator;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    iget-object v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->itr:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 160
    iget v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->cell:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->cell:I

    goto :goto_0

    .line 155
    :catch_0
    move-exception v1

    .line 156
    .local v1, err:Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 164
    .end local v0           #b:Lorg/eclipse/jgit/notes/NoteBucket;
    .end local v1           #err:Ljava/io/IOException;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/FanoutBucket$1;->next()Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/notes/Note;
    .locals 1

    .prologue
    .line 168
    invoke-virtual {p0}, Lorg/eclipse/jgit/notes/FanoutBucket$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lorg/eclipse/jgit/notes/FanoutBucket$1;->itr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/notes/Note;

    return-object v0

    .line 171
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 175
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
