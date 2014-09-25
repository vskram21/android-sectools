.class public abstract Lorg/eclipse/jgit/merge/MergeStrategy;
.super Ljava/lang/Object;
.source "MergeStrategy.java"


# static fields
.field public static final OURS:Lorg/eclipse/jgit/merge/MergeStrategy;

.field public static final RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

.field public static final RESOLVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

.field public static final SIMPLE_TWO_WAY_IN_CORE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

.field private static final STRATEGIES:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/MergeStrategy;",
            ">;"
        }
    .end annotation
.end field

.field public static final THEIRS:Lorg/eclipse/jgit/merge/MergeStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 62
    new-instance v0, Lorg/eclipse/jgit/merge/StrategyOneSided;

    const-string v1, "ours"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/StrategyOneSided;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->OURS:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 65
    new-instance v0, Lorg/eclipse/jgit/merge/StrategyOneSided;

    const-string v1, "theirs"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/StrategyOneSided;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->THEIRS:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 68
    new-instance v0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore;

    invoke-direct {v0}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->SIMPLE_TWO_WAY_IN_CORE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    .line 74
    new-instance v0, Lorg/eclipse/jgit/merge/StrategyResolve;

    invoke-direct {v0}, Lorg/eclipse/jgit/merge/StrategyResolve;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RESOLVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    .line 81
    new-instance v0, Lorg/eclipse/jgit/merge/StrategyRecursive;

    invoke-direct {v0}, Lorg/eclipse/jgit/merge/StrategyRecursive;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->STRATEGIES:Ljava/util/HashMap;

    .line 86
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->OURS:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-static {v0}, Lorg/eclipse/jgit/merge/MergeStrategy;->register(Lorg/eclipse/jgit/merge/MergeStrategy;)V

    .line 87
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->THEIRS:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-static {v0}, Lorg/eclipse/jgit/merge/MergeStrategy;->register(Lorg/eclipse/jgit/merge/MergeStrategy;)V

    .line 88
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->SIMPLE_TWO_WAY_IN_CORE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    invoke-static {v0}, Lorg/eclipse/jgit/merge/MergeStrategy;->register(Lorg/eclipse/jgit/merge/MergeStrategy;)V

    .line 89
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RESOLVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    invoke-static {v0}, Lorg/eclipse/jgit/merge/MergeStrategy;->register(Lorg/eclipse/jgit/merge/MergeStrategy;)V

    .line 90
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    invoke-static {v0}, Lorg/eclipse/jgit/merge/MergeStrategy;->register(Lorg/eclipse/jgit/merge/MergeStrategy;)V

    .line 91
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized get(Ljava/lang/String;)Lorg/eclipse/jgit/merge/MergeStrategy;
    .locals 2
    .parameter "name"

    .prologue
    .line 131
    const-class v1, Lorg/eclipse/jgit/merge/MergeStrategy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->STRATEGIES:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/merge/MergeStrategy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized get()[Lorg/eclipse/jgit/merge/MergeStrategy;
    .locals 3

    .prologue
    .line 142
    const-class v2, Lorg/eclipse/jgit/merge/MergeStrategy;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/eclipse/jgit/merge/MergeStrategy;->STRATEGIES:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    new-array v0, v1, [Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 143
    .local v0, r:[Lorg/eclipse/jgit/merge/MergeStrategy;
    sget-object v1, Lorg/eclipse/jgit/merge/MergeStrategy;->STRATEGIES:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    monitor-exit v2

    return-object v0

    .line 142
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized register(Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeStrategy;)V
    .locals 5
    .parameter "name"
    .parameter "imp"

    .prologue
    .line 117
    const-class v1, Lorg/eclipse/jgit/merge/MergeStrategy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->STRATEGIES:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->mergeStrategyAlreadyExistsAsDefault:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 120
    :cond_0
    :try_start_1
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->STRATEGIES:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    monitor-exit v1

    return-void
.end method

.method public static register(Lorg/eclipse/jgit/merge/MergeStrategy;)V
    .locals 1
    .parameter "imp"

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/MergeStrategy;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lorg/eclipse/jgit/merge/MergeStrategy;->register(Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeStrategy;)V

    .line 103
    return-void
.end method


# virtual methods
.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;
.end method

.method public abstract newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;
.end method
