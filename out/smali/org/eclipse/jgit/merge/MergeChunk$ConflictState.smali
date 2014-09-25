.class public final enum Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;
.super Ljava/lang/Enum;
.source "MergeChunk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/merge/MergeChunk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ConflictState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

.field public static final enum FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

.field public static final enum NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

.field public static final enum NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 62
    new-instance v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    const-string v1, "NO_CONFLICT"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    .line 68
    new-instance v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    const-string v1, "FIRST_CONFLICTING_RANGE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    .line 74
    new-instance v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    const-string v1, "NEXT_CONFLICTING_RANGE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    .line 58
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    sget-object v1, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NO_CONFLICT:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    aput-object v1, v0, v4

    sput-object v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->$VALUES:[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;
    .locals 1
    .parameter "name"

    .prologue
    .line 58
    const-class v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->$VALUES:[Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    return-object v0
.end method
