.class Lorg/eclipse/jgit/revwalk/RevFlagSet$1;
.super Ljava/lang/Object;
.source "RevFlagSet.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/revwalk/RevFlagSet;->iterator()Ljava/util/Iterator;
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
        "Lorg/eclipse/jgit/revwalk/RevFlag;",
        ">;"
    }
.end annotation


# instance fields
.field private current:Lorg/eclipse/jgit/revwalk/RevFlag;

.field final synthetic this$0:Lorg/eclipse/jgit/revwalk/RevFlagSet;

.field final synthetic val$i:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevFlagSet;Ljava/util/Iterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 132
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->this$0:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->val$i:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->val$i:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->next()Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevFlag;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->val$i:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevFlag;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->current:Lorg/eclipse/jgit/revwalk/RevFlag;

    return-object v0
.end method

.method public remove()V
    .locals 3

    .prologue
    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->this$0:Lorg/eclipse/jgit/revwalk/RevFlagSet;

    iget v1, v0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->current:Lorg/eclipse/jgit/revwalk/RevFlag;

    iget v2, v2, Lorg/eclipse/jgit/revwalk/RevFlag;->mask:I

    xor-int/lit8 v2, v2, -0x1

    and-int/2addr v1, v2

    iput v1, v0, Lorg/eclipse/jgit/revwalk/RevFlagSet;->mask:I

    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevFlagSet$1;->val$i:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 146
    return-void
.end method
