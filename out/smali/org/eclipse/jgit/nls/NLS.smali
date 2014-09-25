.class public Lorg/eclipse/jgit/nls/NLS;
.super Ljava/lang/Object;
.source "NLS.java"


# static fields
.field public static final ROOT_LOCALE:Ljava/util/Locale;

.field private static final local:Ljava/lang/InheritableThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/InheritableThreadLocal",
            "<",
            "Lorg/eclipse/jgit/nls/NLS;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final locale:Ljava/util/Locale;

.field private final map:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Class;",
            "Lorg/eclipse/jgit/nls/TranslationBundle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 72
    new-instance v0, Ljava/util/Locale;

    const-string v1, ""

    const-string v2, ""

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/nls/NLS;->ROOT_LOCALE:Ljava/util/Locale;

    .line 74
    new-instance v0, Lorg/eclipse/jgit/nls/NLS$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/nls/NLS$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/nls/NLS;->local:Ljava/lang/InheritableThreadLocal;

    return-void
.end method

.method private constructor <init>(Ljava/util/Locale;)V
    .locals 1
    .parameter "locale"

    .prologue
    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/nls/NLS;->map:Ljava/util/concurrent/ConcurrentHashMap;

    .line 125
    iput-object p1, p0, Lorg/eclipse/jgit/nls/NLS;->locale:Ljava/util/Locale;

    .line 126
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/Locale;Lorg/eclipse/jgit/nls/NLS$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/nls/NLS;-><init>(Ljava/util/Locale;)V

    return-void
.end method

.method private get(Ljava/lang/Class;)Lorg/eclipse/jgit/nls/TranslationBundle;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/nls/TranslationBundle;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/nls/NLS;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/nls/TranslationBundle;

    .line 131
    .local v0, bundle:Lorg/eclipse/jgit/nls/TranslationBundle;
    if-nez v0, :cond_0

    .line 132
    iget-object v2, p0, Lorg/eclipse/jgit/nls/NLS;->locale:Ljava/util/Locale;

    invoke-static {v2, p1}, Lorg/eclipse/jgit/nls/GlobalBundleCache;->lookupBundle(Ljava/util/Locale;Ljava/lang/Class;)Lorg/eclipse/jgit/nls/TranslationBundle;

    move-result-object v0

    .line 135
    iget-object v2, p0, Lorg/eclipse/jgit/nls/NLS;->map:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/nls/TranslationBundle;

    .line 136
    .local v1, old:Lorg/eclipse/jgit/nls/TranslationBundle;
    if-eqz v1, :cond_0

    .line 137
    move-object v0, v1

    .line 139
    .end local v1           #old:Lorg/eclipse/jgit/nls/TranslationBundle;
    :cond_0
    return-object v0
.end method

.method public static getBundleFor(Ljava/lang/Class;)Lorg/eclipse/jgit/nls/TranslationBundle;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/nls/TranslationBundle;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, type:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    sget-object v0, Lorg/eclipse/jgit/nls/NLS;->local:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v0}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/nls/NLS;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/nls/NLS;->get(Ljava/lang/Class;)Lorg/eclipse/jgit/nls/TranslationBundle;

    move-result-object v0

    return-object v0
.end method

.method public static setLocale(Ljava/util/Locale;)V
    .locals 2
    .parameter "locale"

    .prologue
    .line 92
    sget-object v0, Lorg/eclipse/jgit/nls/NLS;->local:Ljava/lang/InheritableThreadLocal;

    new-instance v1, Lorg/eclipse/jgit/nls/NLS;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/nls/NLS;-><init>(Ljava/util/Locale;)V

    invoke-virtual {v0, v1}, Ljava/lang/InheritableThreadLocal;->set(Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public static useJVMDefaultLocale()V
    .locals 3

    .prologue
    .line 101
    sget-object v0, Lorg/eclipse/jgit/nls/NLS;->local:Ljava/lang/InheritableThreadLocal;

    new-instance v1, Lorg/eclipse/jgit/nls/NLS;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/nls/NLS;-><init>(Ljava/util/Locale;)V

    invoke-virtual {v0, v1}, Ljava/lang/InheritableThreadLocal;->set(Ljava/lang/Object;)V

    .line 102
    return-void
.end method
