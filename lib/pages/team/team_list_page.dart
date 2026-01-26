import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/user_characters.dart';
import '../../data/members_master.dart';
import '../../data/member_image_page.dart';
import '../../main.dart'; // routeObserver 用
import '../../widgets/background_scaffold.dart';

/* =====================
   Teams Data
===================== */
final Map<String, Map<String, List<String>>> teams = {
  'Obsidian Knights': {
    '★7 Grand Commander': ['◆ 総団長｜1名'],
    '★6 Vice Commander': ['◆ 副団長｜1名'],
    '★6 High Strategist': ['◆ 戦略戦術官｜1名'],
    '★5 Master of Intelligence': ['◆ 諜報統括｜1名'],
    '★5 Quartermaster General': ['◆ 兵站総監｜1名'],
    '★5 High Executioners': ['◆ 粛清騎士（上位）｜2名'],
    '★4 Knight Captains': ['◆ 騎士長｜6名'],
    '★3 Obsidian Guard': ['◆ 黒曜騎士｜4名'],
    '★3 Vanguard Breakers': ['◆ 突撃破砕隊｜5名'],
    '★3 Shadow Lancers': ['◆ 影槍隊｜4名'],
    '★2 Executioners': ['◆ 粛清騎士｜3名'],
    '★2 Veteran Knights': ['◆ 熟練騎士｜8名'],
    '★1 Arc Support Unit': ['◆ 技術・後方支援｜4名'],
    '★1 Initiate Knights': ['◆ 新鋭騎士｜7名'],
  },
  'Yellow Skulls': {
    '★7 Skull Queen': ['◆ 骸骨女王｜1名'],
    '★6 Laughing Tyrant': ['◆ 狂笑暴君｜1名'],
    '★6 Master of Mayhem': ['◆ 騒乱主教｜1名'],
    '★5 Bone Engineer': ['◆ 骸骨技師｜1名'],
    '★5 Riot Caller': ['◆ 暴動煽動者｜1名'],
    '★5 Cruel Skull Captains': ['◆ 骸隊長（残虐）｜2名'],
    '★4 Skull Captains': ['◆ 骸隊長｜4名'],
    '★4 Mad Drivers': ['◆ 狂走部隊｜4名'],
    '★3 Boom Sisters': ['◆ 爆破姉妹｜7名'],
    '★3 Riot Dancers': ['◆ 暴徒舞踏団｜7名'],
    '★2 Skull Smashers': ['◆ 殴打班｜4名'],
    '★2 Loot Runners': ['◆ 略奪部隊｜4名'],
    '★1 Fresh Skulls': ['◆ 新生骸｜12名'],
  },
  'White Vine': {
    '★7 Vine Mother': ['◆ 蔦の母｜1名'],
    '★6 Pale Regent': ['◆ 白の代行者｜1名'],
    '★6 Whisper Archivist': ['◆ 囁きの記録官｜1名'],
    '★5 Venom Apothecary': ['◆ 白毒調合官｜1名'],
    '★5 Veil Master': ['◆ 帳の主｜1名'],
    '★4 White Dew Scribes': ['◆ 露の書記（純白）｜2名'],
    '★4 Vine Wardens': ['◆ 蔦の守人｜5名'],
    '★3 White Petals': ['◆ 白花衆｜4名'],
    '★3 Root Runners': ['◆ 根廻り｜7名'],
    '★2 Mirror Faces': ['◆ 鏡面役者｜5名'],
    '★2 Dew Scribes': ['◆ 露の書記｜2名'],
    '★1 White Petals（Back Up）': ['◆ 白花衆（補助）｜4名'],
    '★1 Seedlings': ['◆ 芽吹き｜7名'],
  },
  'Gold Serpents': {
    '★7 Serpent Queen': ['◆ 蛇王｜1名'],
    '★6 Coil Regent': ['◆ 蟠摂政｜1名'],
    '★6 Grand Schemer': ['◆ 蛇蝎策略家｜1名'],
    '★5 Oracle of Venom': ['◆ 大蛇猛毒占官｜1名'],
    '★5 Mistress of Contracts': ['◆ 血判管理官｜1名'],
    '★4 Venom Fang Lieutenants': ['◆ 猛毒蛇牙官｜2名'],
    '★3 Fang Lieutenants': ['◆ 蛇牙官｜4名'],
    '★3 Serpent Alchemists': ['◆ 金鱗錬薬師｜4名'],
    '★2 Venom Dancers': ['◆ 毒舞姫｜10名'],
    '★1 Serpent Agents': ['◆ 蛇影工作員｜6名'],
    '★1 Gilded Initiates': ['◆ 金鱗見習い｜2名'],
  },
  'Ruby Storm': {
    '★7 Red Storm Empress': ['◆ 赤嵐の女帝｜1名'],
    '★6 Crimson Viceroy': ['◆ 深紅の副王｜1名'],
    '★6 Tempest Strategist': ['◆ 暴風謀臣｜1名'],
    '★5 Mistress of Carnage': ['◆ 殲滅指揮官｜1名'],
    '★5 Blood Syndicate Keeper': ['◆ 武装鮮血専門監｜1名'],
    '★4 Ruby Warlords': ['◆ 深紅の戦団長｜2名'],
    '★4 Scarlet Warlords': ['◆ 緋色の戦士長｜2名'],
    '★3 Scarlet Reapers': ['◆ 蘇芳制圧部隊｜4名'],
    '★3 Riot Breakhers': ['◆ 朱風突撃ユニットリーダー｜2名'],
    '★2 Riot Breakhers': ['◆ 朱風突撃ユニット｜2名'],
    '★2 Crimson Phantoms': ['◆ 潜影・裏工作｜3名'],
    '★1 Red Pulse Unit': ['◆ 情報・補給・後方攪乱｜2名'],
    '★1 Storm Veterans': ['◆ 古参臙脂｜4名'],
    '★1 Blood Initiates': ['◆ 血の同盟員見習い｜4名'],
  },
  'Blue Blood': {
    '★7 Azure Queen': ['◆ 蒼の王妃｜1名'],
    '★6 Azure Rook': ['◆ 蒼の城塞｜2名'],
    '★5 Azure Bishop': ['◆ 蒼の司教｜2名'],
    '★4 Azure Knight': ['◆ 蒼の騎士｜2名'],
    '★4 Azure Pawn': ['◆ 蒼の精鋭ポーン｜2名'],
    '★3 Cerulean Pawn': ['◆ 蒼のポーン｜6名'],
  },
  '紫焔 – Shien': {
    '★7 Flame Oracle': ['◆ 焔の神託者｜1名'],
    '★6 Violet Sovereign': ['◆ 紫の支配者｜1名'],
    '★6 Ember Binder': ['◆ 焔縛師｜1名'],
    '★5 Chrono Seer': ['◆ 刻視者｜1名'],
    '★5 Violet Archivist': ['◆ 禁呪｜1名'],
    '★4 Ash Blades': ['◆ 灰刃｜2名'],
    '★3 Night Flame': ['◆ 夜焔｜1名'],
    '★3 Spirit Medium': ['◆ 霊媒｜1名'],
  },
  'Shadows': {
    '★7 Abyss': ['◆ 深淵｜1名'],
    '★6 Void': ['◆ 虚無｜4名'],
    '★5 Eclipse': ['◆ 影蝕｜13名'],
  },
  'Nomad': {
    '★6 Ability Users': ['◆ 特異能力者｜7名'],
  },
  
};

// =====================
// チーム名 → アイコン画像対応表
// =====================
final Map<String, String> teamIconMap = {
  'Obsidian Knights': 'assets/team/team1.webp',
  'Yellow Skulls': 'assets/team/team2.webp',
  'White Vine': 'assets/team/team3.webp',
  'Gold Serpents': 'assets/team/team4.webp',
  'Ruby Storm': 'assets/team/team5.webp',
  'Blue Blood': 'assets/team/team6.webp',
  '紫焔 – Shien': 'assets/team/team7.webp',
  'Shadows': 'assets/team/team8.webp',
  'Nomad': 'assets/team/team9.webp',
};


/* =====================
   Team List (3×3 Grid)
===================== */
class TeamListPage extends StatelessWidget {
  const TeamListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const crossAxisSpacing = 12.0;
    const crossAxisCount = 3;
    const mainSpacing = 16.0; // mainAxisSpacing

    final teamNames = teamIconMap.keys.toList();

    TextStyle baseGameTextStyle({
      required double fontSize,
      FontWeight fontWeight = FontWeight.w700,
      double letterSpacing = 1.0,
    }) {
      return GoogleFonts.orbitron(
        fontSize: fontSize,
        height: 1.1,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: Colors.white,
        shadows: const [
          Shadow(offset: Offset(1, 0), color: Colors.black),
          Shadow(offset: Offset(-1, 0), color: Colors.black),
          Shadow(offset: Offset(0, 1), color: Colors.black),
          Shadow(offset: Offset(0, -1), color: Colors.black),
        ],
      );
    }

    return BackgroundScaffold(
      appBar: AppBar(
        title: Text(
          'Team List',
          style: baseGameTextStyle(fontSize: 18, letterSpacing: 1.5),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              const totalSpacing = crossAxisSpacing * (crossAxisCount - 1);
              final itemWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;
              final iconHeight = itemWidth; // 正方形

              return GridView.builder(
                itemCount: teamNames.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: crossAxisSpacing,
                  mainAxisSpacing: mainSpacing,
                  childAspectRatio: itemWidth / (iconHeight + 32 + 6),
                  // アイコン高さ + テキスト高さ(32) + spacing(6)
                ),
                itemBuilder: (context, index) {
                  final team = teamNames[index];
                  final iconPath = teamIconMap[team] ?? 'assets/team/team1.webp';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TeamRoleTextPage(teamName: team),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        // =====================
                        // アイコン横幅いっぱい
                        // =====================
                        SizedBox(
                          width: itemWidth,
                          height: iconHeight,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              iconPath,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.broken_image),
                            ),
                          ),
                        ),

                        const SizedBox(height: 6),

                        // =====================
                        // チーム名
                        // =====================
                        SizedBox(
                          height: 32,
                          child: Text(
                            team,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: baseGameTextStyle(
                              fontSize: 12,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}


// =====================
// Role Name (Japanese) - UI Only
// =====================
final Map<String, String> roleNameJaMap = {

  // ===== Obsidian Knights =====
  '★7 Grand Commander': '総団長',
  '★6 Vice Commander': '副団長',
  '★6 High Strategist': '戦略戦術官',
  '★5 Master of Intelligence': '諜報統括',
  '★5 Quartermaster General': '兵站総監',
  '★5 High Executioners': '粛清騎士（上位）',
  '★4 Knight Captains': '騎士長',
  '★3 Obsidian Guard': '黒曜騎士',
  '★3 Vanguard Breakers': '突撃破砕隊',
  '★3 Shadow Lancers': '影槍隊',
  '★2 Executioners': '粛清騎士',
  '★2 Veteran Knights': '熟練騎士',
  '★1 Arc Support Unit': '技術・後方支援',
  '★1 Initiate Knights': '新鋭騎士',

  // ===== Yellow Skulls =====
  '★7 Skull Queen': '骸骨女王',
  '★6 Laughing Tyrant': '狂笑暴君',
  '★6 Master of Mayhem': '騒乱主教',
  '★5 Bone Engineer': '骸骨技師',
  '★5 Riot Caller': '暴動煽動者',
  '★5 Cruel Skull Captains': '骸隊長（残虐）',
  '★4 Skull Captains': '骸隊長',
  '★4 Mad Drivers': '狂走部隊',
  '★3 Boom Sisters': '爆破姉妹',
  '★3 Riot Dancers': '暴徒舞踏団',
  '★2 Skull Smashers': '殴打班',
  '★2 Loot Runners': '略奪部隊',
  '★1 Fresh Skulls': '新生骸',

  // ===== White Vine =====
  '★7 Vine Mother': '蔦の母',
  '★6 Pale Regent': '白の代行者',
  '★6 Whisper Archivist': '囁きの記録官',
  '★5 Venom Apothecary': '白毒調合官',
  '★5 Veil Master': '帳の主',
  '★4 White Dew Scribes': '露の書記（純白）',
  '★4 Vine Wardens': '蔦の守人',
  '★3 White Petals': '白花衆',
  '★3 Root Runners': '根廻り',
  '★2 Mirror Faces': '鏡面役者',
  '★2 Dew Scribes': '露の書記',
  '★1 White Petals（Back Up）': '白花衆（補助）',
  '★1 Seedlings': '芽吹き',

  // ===== Gold Serpents =====
  '★7 Serpent Queen': '蛇王',
  '★6 Coil Regent': '蟠摂政',
  '★6 Grand Schemer': '蛇蝎策略家',
  '★5 Oracle of Venom': '大蛇猛毒占官',
  '★5 Mistress of Contracts': '血判管理官',
  '★4 Venom Fang Lieutenants': '猛毒蛇牙官',
  '★3 Fang Lieutenants': '蛇牙官',
  '★3 Serpent Alchemists': '金鱗錬薬師',
  '★2 Venom Dancers': '毒舞姫',
  '★1 Serpent Agents': '蛇影工作員',
  '★1 Gilded Initiates': '金鱗見習い',

  // ===== Ruby Storm =====
  '★7 Red Storm Empress': '赤嵐の女帝',
  '★6 Crimson Viceroy': '深紅の副王',
  '★6 Tempest Strategist': '暴風謀臣',
  '★5 Mistress of Carnage': '殲滅指揮官',
  '★5 Blood Syndicate Keeper': '武装鮮血専門監',
  '★4 Ruby Warlords': '深紅の戦団長',
  '★4 Scarlet Warlords': '緋色の戦士長',
  '★3 Scarlet Reapers': '蘇芳制圧部隊',
  '★3 Riot Breakhers': '朱風突撃ユニットリーダー',
  '★2 Riot Breakhers': '朱風突撃ユニット',
  '★2 Crimson Phantoms': '潜影・裏工作',
  '★1 Red Pulse Unit': '情報・補給・後方攪乱',
  '★1 Storm Veterans': '古参臙脂',
  '★1 Blood Initiates': '血の同盟員見習い',

  // ===== Blue Blood =====
  '★7 Azure Queen': '蒼の王妃',
  '★6 Azure Rook': '蒼の城塞',
  '★5 Azure Bishop': '蒼の司教',
  '★4 Azure Knight': '蒼の騎士',
  '★4 Azure Pawn': '蒼の精鋭ポーン',
  '★3 Cerulean Pawn': '蒼のポーン',

  // ===== 紫焔 – Shien =====
  '★7 Flame Oracle': '焔の神託者',
  '★6 Violet Sovereign': '紫の支配者',
  '★6 Ember Binder': '焔縛師',
  '★5 Chrono Seer': '刻視者',
  '★5 Violet Archivist': '禁呪',
  '★4 Ash Blades': '灰刃',
  '★3 Night Flame': '夜焔',
  '★3 Spirit Medium': '霊媒',

  // ===== Shadows =====
  '★7 Abyss': '深淵',
  '★6 Void': '虚無',
  '★5 Eclipse': '影蝕',

  // ===== Nomad =====
  '★6 Ability Users': '特異能力者',
};

/* =====================  
   Team Role Text Page
===================== */
class TeamRoleTextPage extends StatelessWidget {
  final String teamName;
  const TeamRoleTextPage({super.key, required this.teamName});

  @override
  Widget build(BuildContext context) {
    final roles = teams[teamName] ?? {};

    // =====================
    // ★ 使用するボタン画像（1種類のみ）
    // =====================
    const buttonImage = 'assets/button/button7.webp';

    // 共通：Orbitron + Noto Sans JP + 縁取り影
    TextStyle baseGameTextStyle({
      required double fontSize,
      FontWeight fontWeight = FontWeight.w700,
      double letterSpacing = 1.0,
    }) {
      return GoogleFonts.orbitron(
        fontSize: fontSize,
        height: 1.1,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: Colors.white,
        shadows: const [
          Shadow(offset: Offset(1, 0), color: Colors.black),
          Shadow(offset: Offset(-1, 0), color: Colors.black),
          Shadow(offset: Offset(0, 1), color: Colors.black),
          Shadow(offset: Offset(0, -1), color: Colors.black),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          teamName,
          style: baseGameTextStyle(
            fontSize: 18,
            letterSpacing: 1.4,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // =====================
              // ① 真っ黒な下地
              // =====================
              const Positioned.fill(
                child: ColoredBox(color: Colors.black),
              ),

              // =====================
              // ② 背景画像
              // =====================
              Positioned.fill(
                child: Image.asset(
                  'assets/bg/bg1.webp',
                  fit: BoxFit.cover,
                ),
              ),

              // =====================
              // ③ スクロール可能コンテンツ
              // =====================
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      kToolbarHeight + 24,
                      16,
                      24,
                    ),
                    child: Column(
                      children: roles.entries.map((e) {
                        final role = e.key;
                        final roleMembers = membersMaster.where((m) =>
                            m.team == teamName &&
                            m.role == role
                        ).toList();

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RoleMemberGridPage(
                                    roleName: role,
                                    members: roleMembers,
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: AspectRatio(
                                // =====================
                                // ★ 縦横比固定（高さは自動）
                                // =====================
                                aspectRatio: 3.6 / 1,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    // =====================
                                    // ★ button7 固定
                                    //   縦横比維持・切れない
                                    // =====================
                                    Image.asset(
                                      buttonImage,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                    ),

                                    // =====================
                                    // テキスト
                                    // =====================
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            role,
                                            style: baseGameTextStyle(
                                              fontSize: 14,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            '◆ ${getRoleDisplayName(role)}｜${roleMembers.length}名',
                                            style: baseGameTextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


/* =====================
   Role Name Helper
===================== */
String getRoleDisplayName(String role) {
  return roleNameJaMap[role] ?? role;
}

/* =====================
   RoleMemberGridPage
===================== */
class RoleMemberGridPage extends StatefulWidget {
  final String roleName;
  final List<Character> members;

  const RoleMemberGridPage({
    super.key,
    required this.roleName,
    required this.members,
  });

  @override
  State<RoleMemberGridPage> createState() => _RoleMemberGridPageState();
}

class _RoleMemberGridPageState extends State<RoleMemberGridPage>
    with RouteAware {
  late List<bool> _visible;

  @override
  void initState() {
    super.initState();
    _visible = List.generate(widget.members.length, (_) => false);
  }

  @override
  void didPush() => _restartAnimation();
  @override
  void didPopNext() => _restartAnimation();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) routeObserver.subscribe(this, route);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  void _restartAnimation() {
    _visible = List.generate(widget.members.length, (_) => false);
    _startSequentialReveal();
  }

  /// ★ 左上 → 右 → 下 を100%保証
  Future<void> _startSequentialReveal() async {
    for (int i = 0; i < widget.members.length; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      if (!mounted) return;
      setState(() => _visible[i] = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle baseGameTextStyle({
      required double fontSize,
      FontWeight fontWeight = FontWeight.w600,
      double letterSpacing = 1.0,
    }) {
      return GoogleFonts.orbitron(
        fontSize: fontSize,
        height: 1.1,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: Colors.white,
        shadows: const [
          Shadow(offset: Offset(1, 0), color: Colors.black),
          Shadow(offset: Offset(-1, 0), color: Colors.black),
          Shadow(offset: Offset(0, 1), color: Colors.black),
          Shadow(offset: Offset(0, -1), color: Colors.black),
        ],
      );
    }

    return BackgroundScaffold(
      appBar: AppBar(
        title: Text(
          widget.roleName,
          style: baseGameTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.members.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final member = widget.members[index];

          /// ===== 正しい所持判定 =====
          final bool isOwned =
              userCharacters.any((c) => c.id == member.id);

          /// ===== 表示用画像 =====
          final String imagePath = isOwned
              ? member.image!
              : 'assets/cards1/unknown.webp';

          return AnimatedSlide(
            offset: _visible[index] ? Offset.zero : const Offset(0, 0.50),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            child: AnimatedOpacity(
              opacity: _visible[index] ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: GestureDetector(
                onTap: () {
                  if (!isOwned) return;

                  /// ★ 修正ここだけ
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MemberImagePage(
                        beforeImagePath: member.normalImage!,
                        afterImagePath: member.evolvedImage!, // 進化後画像
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: isOwned
                            ? Transform.scale(
                                scale: 2.5,
                                alignment: Alignment.topCenter,
                                child: _buildImage(imagePath),
                              )
                            : _buildImage(imagePath),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 16,
                      child: Text(
                        isOwned ? member.name : '？？？',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: baseGameTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// ===== 画像表示（デバッグ可）=====
  Widget _buildImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      errorBuilder: (_, __, ___) {
        return Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text(
            'IMAGE\nNOT FOUND',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        );
      },
    );
  }
}
