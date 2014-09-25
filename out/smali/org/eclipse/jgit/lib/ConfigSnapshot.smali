.class Lorg/eclipse/jgit/lib/ConfigSnapshot;
.super Ljava/lang/Object;
.source "ConfigSnapshot.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/ConfigSnapshot$1;,
        Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;,
        Lorg/eclipse/jgit/lib/ConfigSnapshot$LineComparator;,
        Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;
    }
.end annotation


# instance fields
.field final baseState:Lorg/eclipse/jgit/lib/ConfigSnapshot;

.field final cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final entryList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;"
        }
    .end annotation
.end field

.field volatile names:Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;

.field volatile sorted:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;Lorg/eclipse/jgit/lib/ConfigSnapshot;)V
    .locals 4
    .parameter
    .parameter "base"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;",
            "Lorg/eclipse/jgit/lib/ConfigSnapshot;",
            ")V"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, entries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    .line 81
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0x10

    const/high16 v2, 0x3f40

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->cache:Ljava/util/Map;

    .line 82
    iput-object p2, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->baseState:Lorg/eclipse/jgit/lib/ConfigSnapshot;

    .line 83
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 72
    invoke-static/range {p0 .. p5}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->compare2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private static compare2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter "aSection"
    .parameter "aSubsection"
    .parameter "aName"
    .parameter "bSection"
    .parameter "bSubsection"
    .parameter "bName"

    .prologue
    .line 202
    invoke-static {p0, p3}, Lorg/eclipse/jgit/util/StringUtils;->compareIgnoreCase(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 203
    .local v0, c:I
    if-eqz v0, :cond_0

    move v1, v0

    .line 216
    :goto_0
    return v1

    .line 206
    :cond_0
    if-nez p1, :cond_1

    if-eqz p4, :cond_1

    .line 207
    const/4 v1, -0x1

    goto :goto_0

    .line 208
    :cond_1
    if-eqz p1, :cond_2

    if-nez p4, :cond_2

    .line 209
    const/4 v1, 0x1

    goto :goto_0

    .line 210
    :cond_2
    if-eqz p1, :cond_3

    .line 211
    invoke-static {p1, p4}, Lorg/eclipse/jgit/util/StringUtils;->compareWithCase(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 212
    if-eqz v0, :cond_3

    move v1, v0

    .line 213
    goto :goto_0

    .line 216
    :cond_3
    invoke-static {p2, p5}, Lorg/eclipse/jgit/util/StringUtils;->compareIgnoreCase(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method private end(Ljava/util/List;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter
    .parameter "i"
    .parameter "s1"
    .parameter "s2"
    .parameter "n"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 173
    .local p1, s:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 174
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    invoke-virtual {v0, p3, p4, p5}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 179
    :cond_0
    return p2
.end method

.method private find(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11
    .parameter
    .parameter "s1"
    .parameter "s2"
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, s:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    const/4 v9, 0x0

    .line 145
    .local v9, low:I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v8

    .line 146
    .local v8, high:I
    :goto_0
    if-ge v9, v8, :cond_2

    .line 147
    add-int v0, v9, v8

    ushr-int/lit8 v10, v0, 0x1

    .line 148
    .local v10, mid:I
    invoke-interface {p1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 149
    .local v7, e:Lorg/eclipse/jgit/lib/ConfigLine;
    iget-object v3, v7, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    iget-object v4, v7, Lorg/eclipse/jgit/lib/ConfigLine;->subsection:Ljava/lang/String;

    iget-object v5, v7, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    move-object v0, p2

    move-object v1, p3

    move-object v2, p4

    invoke-static/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->compare2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 152
    .local v6, cmp:I
    if-gez v6, :cond_0

    .line 153
    move v8, v10

    goto :goto_0

    .line 154
    :cond_0
    if-nez v6, :cond_1

    move-object v0, p0

    move-object v1, p1

    move v2, v10

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 155
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->first(Ljava/util/List;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 159
    .end local v6           #cmp:I
    .end local v7           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    .end local v10           #mid:I
    :goto_1
    return v0

    .line 157
    .restart local v6       #cmp:I
    .restart local v7       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    .restart local v10       #mid:I
    :cond_1
    add-int/lit8 v9, v10, 0x1

    goto :goto_0

    .line 159
    .end local v6           #cmp:I
    .end local v7           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    .end local v10           #mid:I
    :cond_2
    add-int/lit8 v0, v9, 0x1

    neg-int v0, v0

    goto :goto_1
.end method

.method private first(Ljava/util/List;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter
    .parameter "i"
    .parameter "s1"
    .parameter "s2"
    .parameter "n"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 163
    .local p1, s:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    :goto_0
    if-lez p2, :cond_0

    .line 164
    add-int/lit8 v0, p2, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    invoke-virtual {v0, p3, p4, p5}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    .line 169
    :cond_0
    return p2
.end method

.method private getNamesInternal(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;
    .locals 7
    .parameter "section"
    .parameter "subsection"
    .parameter "recursive"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->sorted()Ljava/util/List;

    move-result-object v5

    .line 111
    .local v5, s:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    const-string v6, ""

    invoke-direct {p0, v5, p1, p2, v6}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->find(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 112
    .local v1, idx:I
    if-gez v1, :cond_0

    .line 113
    add-int/lit8 v6, v1, 0x1

    neg-int v1, v6

    .line 115
    :cond_0
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    .line 116
    .local v4, m:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 117
    add-int/lit8 v2, v1, 0x1

    .end local v1           #idx:I
    .local v2, idx:I
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 118
    .local v0, e:Lorg/eclipse/jgit/lib/ConfigLine;
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jgit/lib/ConfigLine;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    move v1, v2

    .line 126
    .end local v0           #e:Lorg/eclipse/jgit/lib/ConfigLine;
    .end local v2           #idx:I
    .restart local v1       #idx:I
    :cond_1
    if-eqz p3, :cond_2

    iget-object v6, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->baseState:Lorg/eclipse/jgit/lib/ConfigSnapshot;

    if-eqz v6, :cond_2

    .line 127
    iget-object v6, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->baseState:Lorg/eclipse/jgit/lib/ConfigSnapshot;

    invoke-direct {v6, p1, p2, p3}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getNamesInternal(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 128
    :cond_2
    return-object v4

    .line 120
    .end local v1           #idx:I
    .restart local v0       #e:Lorg/eclipse/jgit/lib/ConfigLine;
    .restart local v2       #idx:I
    :cond_3
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    if-nez v6, :cond_4

    move v1, v2

    .line 121
    .end local v2           #idx:I
    .restart local v1       #idx:I
    goto :goto_0

    .line 122
    .end local v1           #idx:I
    .restart local v2       #idx:I
    :cond_4
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    invoke-static {v6}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 123
    .local v3, l:Ljava/lang/String;
    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 124
    iget-object v6, v0, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    invoke-interface {v4, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    move v1, v2

    .line 125
    .end local v2           #idx:I
    .restart local v1       #idx:I
    goto :goto_0
.end method

.method private names()Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;
    .locals 1

    .prologue
    .line 228
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->names:Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;

    .line 229
    .local v0, n:Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;
    if-nez v0, :cond_0

    .line 230
    new-instance v0, Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;

    .end local v0           #n:Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;
    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;-><init>(Lorg/eclipse/jgit/lib/ConfigSnapshot;)V

    .restart local v0       #n:Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;
    iput-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->names:Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;

    .line 231
    :cond_0
    return-object v0
.end method

.method private static sort(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, in:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 191
    .local v2, sorted:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ConfigLine;

    .line 192
    .local v1, line:Lorg/eclipse/jgit/lib/ConfigLine;
    iget-object v3, v1, Lorg/eclipse/jgit/lib/ConfigLine;->section:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, v1, Lorg/eclipse/jgit/lib/ConfigLine;->name:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 193
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 195
    .end local v1           #line:Lorg/eclipse/jgit/lib/ConfigLine;
    :cond_1
    new-instance v3, Lorg/eclipse/jgit/lib/ConfigSnapshot$LineComparator;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/lib/ConfigSnapshot$LineComparator;-><init>(Lorg/eclipse/jgit/lib/ConfigSnapshot$1;)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 196
    return-object v2
.end method

.method private sorted()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ConfigLine;",
            ">;"
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->sorted:Ljava/util/List;

    .line 184
    .local v0, r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    if-nez v0, :cond_0

    .line 185
    iget-object v1, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->entryList:Ljava/util/List;

    invoke-static {v1}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->sort(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ConfigSnapshot;->sorted:Ljava/util/List;

    .line 186
    :cond_0
    return-object v0
.end method


# virtual methods
.method get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 11
    .parameter "section"
    .parameter "subsection"
    .parameter "name"

    .prologue
    .line 132
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->sorted()Ljava/util/List;

    move-result-object v1

    .line 133
    .local v1, s:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ConfigLine;>;"
    invoke-direct {p0, v1, p1, p2, p3}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->find(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 134
    .local v2, idx:I
    if-gez v2, :cond_0

    .line 135
    const/4 v10, 0x0

    .line 140
    :goto_0
    return-object v10

    :cond_0
    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .line 136
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->end(Ljava/util/List;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 137
    .local v6, end:I
    sub-int v0, v6, v2

    new-array v10, v0, [Ljava/lang/String;

    .line 138
    .local v10, r:[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, i:I
    move v8, v7

    .end local v7           #i:I
    .local v8, i:I
    move v9, v2

    .end local v2           #idx:I
    .local v9, idx:I
    :goto_1
    if-ge v9, v6, :cond_1

    .line 139
    add-int/lit8 v7, v8, 0x1

    .end local v8           #i:I
    .restart local v7       #i:I
    add-int/lit8 v2, v9, 0x1

    .end local v9           #idx:I
    .restart local v2       #idx:I
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ConfigLine;

    iget-object v0, v0, Lorg/eclipse/jgit/lib/ConfigLine;->value:Ljava/lang/String;

    aput-object v0, v10, v8

    move v8, v7

    .end local v7           #i:I
    .restart local v8       #i:I
    move v9, v2

    .end local v2           #idx:I
    .restart local v9       #idx:I
    goto :goto_1

    :cond_1
    move v2, v9

    .line 140
    .end local v9           #idx:I
    .restart local v2       #idx:I
    goto :goto_0
.end method

.method getNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Set;
    .locals 1
    .parameter "section"
    .parameter "subsection"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getNames(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method getNames(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Set;
    .locals 2
    .parameter "section"
    .parameter "subsection"
    .parameter "recursive"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->getNamesInternal(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object v0

    .line 105
    .local v0, m:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;-><init>(Ljava/util/Map;)V

    return-object v1
.end method

.method getSections()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->names()Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;->sections:Lorg/eclipse/jgit/lib/ConfigSnapshot$CaseFoldingSet;

    return-object v0
.end method

.method getSubsections(Ljava/lang/String;)Ljava/util/Set;
    .locals 3
    .parameter "section"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ConfigSnapshot;->names()Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;

    move-result-object v2

    iget-object v0, v2, Lorg/eclipse/jgit/lib/ConfigSnapshot$SectionNames;->subsections:Ljava/util/Map;

    .line 91
    .local v0, m:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 92
    .local v1, r:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v1, :cond_0

    .line 93
    invoke-static {p1}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #r:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    check-cast v1, Ljava/util/Set;

    .line 94
    .restart local v1       #r:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    if-nez v1, :cond_1

    .line 95
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    .line 96
    :goto_0
    return-object v2

    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    goto :goto_0
.end method
