.class Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;
.super Ljava/lang/Object;
.source "PackWriter.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;->iterator()Ljava/util/Iterator;
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
        "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
        ">;"
    }
.end annotation


# instance fields
.field private final it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter;",
            ">;>;"
        }
    .end annotation
.end field

.field private next:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;)V
    .locals 1
    .parameter

    .prologue
    .line 175
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->it:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 181
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->next:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    if-eqz v1, :cond_1

    move v1, v2

    .line 190
    :goto_0
    return v1

    .line 188
    .local v0, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/internal/storage/pack/PackWriter;>;"
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 183
    .end local v0           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/internal/storage/pack/PackWriter;>;"
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 184
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 185
    .restart local v0       #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/internal/storage/pack/PackWriter;>;"
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->next:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    .line 186
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->next:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    if-eqz v1, :cond_0

    move v1, v2

    .line 187
    goto :goto_0

    .line 190
    .end local v0           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lorg/eclipse/jgit/internal/storage/pack/PackWriter;>;"
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 175
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->next()Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    .locals 2

    .prologue
    .line 194
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 195
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->next:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    .line 196
    .local v0, result:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$1$1;->next:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    .line 197
    return-object v0

    .line 199
    .end local v0           #result:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :cond_0
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 203
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
