.class Lorg/eclipse/jgit/nls/GlobalBundleCache;
.super Ljava/lang/Object;
.source "GlobalBundleCache.java"


# static fields
.field private static final cachedBundles:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/Locale;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class;",
            "Lorg/eclipse/jgit/nls/TranslationBundle;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/nls/GlobalBundleCache;->cachedBundles:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized lookupBundle(Ljava/util/Locale;Ljava/lang/Class;)Lorg/eclipse/jgit/nls/TranslationBundle;
    .locals 5
    .parameter "locale"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/eclipse/jgit/nls/TranslationBundle;",
            ">(",
            "Ljava/util/Locale;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, type:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    const-class v4, Lorg/eclipse/jgit/nls/GlobalBundleCache;

    monitor-enter v4

    :try_start_0
    sget-object v3, Lorg/eclipse/jgit/nls/GlobalBundleCache;->cachedBundles:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 88
    .local v1, bundles:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Class;Lorg/eclipse/jgit/nls/TranslationBundle;>;"
    if-nez v1, :cond_0

    .line 89
    new-instance v1, Ljava/util/HashMap;

    .end local v1           #bundles:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Class;Lorg/eclipse/jgit/nls/TranslationBundle;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 90
    .restart local v1       #bundles:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Class;Lorg/eclipse/jgit/nls/TranslationBundle;>;"
    sget-object v3, Lorg/eclipse/jgit/nls/GlobalBundleCache;->cachedBundles:Ljava/util/Map;

    invoke-interface {v3, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    :cond_0
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/nls/TranslationBundle;

    .line 93
    .local v0, bundle:Lorg/eclipse/jgit/nls/TranslationBundle;
    if-nez v0, :cond_1

    .line 94
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #bundle:Lorg/eclipse/jgit/nls/TranslationBundle;
    check-cast v0, Lorg/eclipse/jgit/nls/TranslationBundle;

    .line 95
    .restart local v0       #bundle:Lorg/eclipse/jgit/nls/TranslationBundle;
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/nls/TranslationBundle;->load(Ljava/util/Locale;)V

    .line 96
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 98
    :cond_1
    monitor-exit v4

    return-object v0

    .line 99
    .end local v0           #bundle:Lorg/eclipse/jgit/nls/TranslationBundle;
    .end local v1           #bundles:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Class;Lorg/eclipse/jgit/nls/TranslationBundle;>;"
    :catch_0
    move-exception v2

    .line 100
    .local v2, e:Ljava/lang/InstantiationException;
    :try_start_1
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3, v2}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    .end local v2           #e:Ljava/lang/InstantiationException;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 101
    :catch_1
    move-exception v2

    .line 102
    .local v2, e:Ljava/lang/IllegalAccessException;
    :try_start_2
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3, v2}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method
