.class abstract Lorg/eclipse/jgit/lib/RefUpdate$Store;
.super Ljava/lang/Object;
.source "RefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/RefUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "Store"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/lib/RefUpdate;


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/lib/RefUpdate;)V
    .locals 0
    .parameter

    .prologue
    .line 666
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RefUpdate$Store;->this$0:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 666
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/RefUpdate$Store;-><init>(Lorg/eclipse/jgit/lib/RefUpdate;)V

    return-void
.end method


# virtual methods
.method abstract execute(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
