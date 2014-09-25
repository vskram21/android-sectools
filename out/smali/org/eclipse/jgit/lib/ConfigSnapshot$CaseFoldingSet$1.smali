.class Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;
.super Ljava/lang/Object;
.source "ConfigSnapshot.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;->iterator()Ljava/util/Iterator;
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
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;

.field final synthetic val$i:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;Ljava/util/Iterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 288
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;->this$0:Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;

    iput-object p2, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;->val$i:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 290
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;->val$i:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 288
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet$1;->val$i:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 298
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
