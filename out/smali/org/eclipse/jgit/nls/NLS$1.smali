.class final Lorg/eclipse/jgit/nls/NLS$1;
.super Ljava/lang/InheritableThreadLocal;
.source "NLS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/nls/NLS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/InheritableThreadLocal",
        "<",
        "Lorg/eclipse/jgit/nls/NLS;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/InheritableThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/eclipse/jgit/nls/NLS$1;->initialValue()Lorg/eclipse/jgit/nls/NLS;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Lorg/eclipse/jgit/nls/NLS;
    .locals 3

    .prologue
    .line 76
    new-instance v0, Lorg/eclipse/jgit/nls/NLS;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/nls/NLS;-><init>(Ljava/util/Locale;Lorg/eclipse/jgit/nls/NLS$1;)V

    return-object v0
.end method
