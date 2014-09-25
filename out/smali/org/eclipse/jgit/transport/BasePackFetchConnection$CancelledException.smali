.class Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;
.super Ljava/lang/Exception;
.source "BasePackFetchConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/BasePackFetchConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CancelledException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 780
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 780
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$CancelledException;-><init>()V

    return-void
.end method
