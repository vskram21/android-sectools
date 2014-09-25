.class public final enum Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;
.super Ljava/lang/Enum;
.source "DfsObjDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PackSource"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

.field public static final enum COMPACT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

.field public static final enum GC:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

.field public static final enum INSERT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

.field public static final enum RECEIVE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

.field public static final enum UNREACHABLE_GARBAGE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;


# instance fields
.field final category:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 68
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    const-string v1, "INSERT"

    invoke-direct {v0, v1, v2, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->INSERT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    .line 79
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    const-string v1, "RECEIVE"

    invoke-direct {v0, v1, v3, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->RECEIVE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    .line 90
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    const-string v1, "GC"

    invoke-direct {v0, v1, v4, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->GC:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    .line 101
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    const-string v1, "COMPACT"

    invoke-direct {v0, v1, v5, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->COMPACT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    .line 110
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    const-string v1, "UNREACHABLE_GARBAGE"

    invoke-direct {v0, v1, v6, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->UNREACHABLE_GARBAGE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    .line 66
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->INSERT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->RECEIVE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->GC:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->COMPACT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->UNREACHABLE_GARBAGE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    aput-object v1, v0, v6

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->$VALUES:[Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter "category"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 114
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 115
    iput p3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->category:I

    .line 116
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;
    .locals 1
    .parameter "name"

    .prologue
    .line 66
    const-class v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->$VALUES:[Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    return-object v0
.end method
