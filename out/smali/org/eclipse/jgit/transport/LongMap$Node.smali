.class Lorg/eclipse/jgit/transport/LongMap$Node;
.super Ljava/lang/Object;
.source "LongMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/LongMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Node"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final key:J

.field next:Lorg/eclipse/jgit/transport/LongMap$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/transport/LongMap$Node",
            "<TV;>;"
        }
    .end annotation
.end field

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(JLjava/lang/Object;)V
    .locals 0
    .parameter "k"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, this:Lorg/eclipse/jgit/transport/LongMap$Node;,"Lorg/eclipse/jgit/transport/LongMap$Node<TV;>;"
    .local p3, v:Ljava/lang/Object;,"TV;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    iput-wide p1, p0, Lorg/eclipse/jgit/transport/LongMap$Node;->key:J

    .line 155
    iput-object p3, p0, Lorg/eclipse/jgit/transport/LongMap$Node;->value:Ljava/lang/Object;

    .line 156
    return-void
.end method
